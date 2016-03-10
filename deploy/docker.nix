# Build steps:
# $ nix-build deploy/docker.nix
# $ docker load -i result
# $ docker run hiplambda

with import ((import <nixpkgs> { }).fetchgit {
  url = "https://github.com/puffnfresh/nixpkgs.git";
  rev = "b2e431b49e25c69c7cb68dce79d18416329b7c47";
  sha256 = "0a45i9nfv2h9i4graqvam49d7w86gl3by2c1srqr2ab9dl0d6qsn";
}) { };

let
  hpkgs = pkgs.haskell.packages.ghc7103.override {
    overrides = self: super: {
      hipbot = self.callPackage ../hipbot.nix { };
      hiplambda = self.callPackage ../hiplambda.nix { };
    };
  };
  packages = import ./packages.nix { haskellPackages = hpkgs; };
  localHoogle = import ./hoogle.nix {
    inherit (pkgs) stdenv;
    inherit (hpkgs) hoogle rehoo ghc;
    inherit packages;
  };
  mueval = hpkgs.ghcWithPackages (p: [ p.mueval ] ++ packages );
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
        sha256 = "0jnwabyfgy3smf3r0hgz1hipjvjaka6asj6byc5acg7rnmx828xh";
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
      "HOOGLE_DB=${localHoogle}/share/hoogle/default.hoo"
      "MUEVAL_TIMEOUT=8"
      "NIX_GHC_LIBDIR=${mueval}/lib/ghc-7.10.3"
      "PATH=${mueval}/bin"
    ];
    ExposedPorts = {
      "8080/tcp" = {};
    };
  };
}
