{ baseurl }:

{
  # Name of our deployment
  network.description = "HipLambda";

  # Enable rolling back to previous versions of our infrastructure
  network.enableRollback = true;

  # It consists of a single server named 'hiplambda'
  hiplambda =
    # Every server gets passed a few arguments, including a reference
    # to nixpkgs (pkgs)
    { config, pkgs, ... }:
    with (import <nixpkgs/pkgs/development/haskell-modules/lib.nix> { inherit pkgs; });
    let
      # A custom haskell package set with hiplambda
      hpkgs = pkgs.haskell.packages.ghc7101.override {
        overrides = self: super: {
          # need a custom mueval util a version which compiles on 7.10.1 
          # is available https://github.com/gwern/mueval/issues/9
          mueval = appendPatch (self.callPackage ./mueval.nix {}) ./mueval-nix.patch;

          # latest versions aren't yet in nixpkgs
          webcrank = self.callPackage ./webcrank.nix {};
          webcrank-wai = self.callPackage ./webcrank-wai.nix {};
          hipbot = self.callPackage ./hipbot.nix {};

          hiplambda = hpkgs.callPackage ../hiplambda.nix {};
        };
      };
      ghc = hpkgs.ghcWithPackages(haskellPackages: with haskellPackages;
        let
          extras = import ./packages.nix { inherit haskellPackages; };
        in
         [ mueval hiplambda ] ++ extras
      );
      hoogle = withHoogle ghc;
    in {
      environment = {
        /* systemPackages = [ ghc ]; */
        systemPackages = [ hoogle ghc pkgs.parted ];
        variables.NIX_GHC_LIBDIR = "${ghc}/lib/ghc-7.10.1";
      };

      networking.firewall = {
        enable = true;
        allowedTCPPorts = [ 80 8080 22 ];
        allowPing = true;
      };

      # nginx configured as a reverse proxy
      services = {
        nginx = {
          enable = true;
          config = ''
            worker_processes  4;

            events {
              worker_connections  2048;
              use epoll;
            }

            worker_rlimit_nofile 8192;

            http { 
              upstream hiplambda {
                server 127.0.0.1:8080  max_fails=5 fail_timeout=60s;
              }

              server {
                listen 80;

                location / {
                  proxy_pass http://hiplambda;
                  proxy_next_upstream error timeout invalid_header http_500 http_502 http_503 http_504;

                  proxy_buffering off;
                  proxy_redirect off;

                  proxy_set_header        Host            $host;
                  proxy_set_header        X-Real-IP       $remote_addr;
                  proxy_set_header        X-Forwarded-For $proxy_add_x_forwarded_for;
                }
              }
            }
          '';
        };

        postgresql = {
          enable = true;
          package = pkgs.postgresql;
          enableTCPIP = true;
          authentication = ''
            local all all                trust
            host  all all 127.0.0.1/32   trust
            host  all all ::1/128        trust
            host  all all 192.168.1.0/24 trust
          '';
        };
      };

      # Run hiplambda as a systemd service
      # We can configure the service to automatically start on boot and to restart
      # the process in case it crashes
      systemd.services.hiplambda = {
        description = "HipLambda";
        wantedBy = [ "multi-user.target" ];
        after = [ "network.target" ];
        requires = [ "postgresql.service" ];
        environment = {
          PORT = "8080";
          BASE_URI = baseurl;
          MUEVAL_TIMEOUT = "8";
          DATABASE_URL = "postgresql://localhost/hiplambda";
        };
        serviceConfig = {
          ExecStart = "${ghc}/bin/hiplambda";
          # For security reasons we'll run this process as a special 'hiplambda' user
          User = "hiplambda";
          Restart = "always";
        };
      };

      # And lastly we ensure the user we run our application as is created
      users.extraUsers = {
        hiplambda = { };
      };
    };
}
