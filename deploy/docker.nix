# Build steps:
# $ nix-build docker.nix
# $ docker load -i result
# $ docker run hiplambda

with import <nixpkgs> { };

let
  hpkgs = pkgs.haskell.packages.lts.override {
    overrides = self: super: {
      HUnit = self.callHackage "HUnit" "1.2.5.2" { };
      hint = self.callHackage "hint" "0.4.3" { };
      hipbot = self.callPackage ../hipbot.nix { };
      hiplambda = self.callPackage ../hiplambda.nix { };
    };
  };
  packages = import ./packages.nix { haskellPackages = hpkgs; };
  localHoogle = hpkgs.callPackage <nixpkgs/pkgs/development/haskell-modules/hoogle.nix> { inherit packages; };
  mueval = hpkgs.ghcWithPackages (p: [ p.mueval ] ++ packages);
  alpine = dockerTools.buildImage {
    name = "alpine";
    contents = cacert;
    fromImage = dockerTools.buildImage {
      name = "alpine";
      runAsRoot = ''
        echo "hosts: files dns myhostname mymachines" > /etc/nsswitch.conf
      '';
      fromImage = dockerTools.pullImage {
        imageName = "alpine";
        imageTag = "3.3";
        imageId = "f58d61a874bedb7cdcb5a409ebb0c53b0656b880695c14e78a69902873358d5f";
        sha256 = "0lvd5zxjgwp3jl5r8qgb2kapmxclpgdv1a7c03yiagxsil5gwb8c";
      };
    };
  };
in
# TODO: Probably should make a Nix GHC base image.
dockerTools.buildImage {
  name = "hiplambda";
  fromImage = alpine;
  contents = hpkgs.hiplambda;
  config = {
    Cmd = [ "/bin/hiplambda" ];
    Env = [
      "HOOGLE_DB=${localHoogle}/share/doc/hoogle/default.hoo"
      "MUEVAL_TIMEOUT=8"
      "NIX_GHC_LIBDIR=${mueval}/lib/ghc-7.10.3"
      "PATH=${mueval}/bin"
    ];
    ExposedPorts = {
      "8080/tcp" = {};
    };
  };
}
