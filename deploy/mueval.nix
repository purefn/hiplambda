{ mkDerivation, base, Cabal, containers, directory
, extensible-exceptions, fetchgit, filepath, hint, mtl, process
, QuickCheck, show, simple-reflect, stdenv, unix
}:
mkDerivation {
  pname = "mueval";
  version = "0.9.1.1.1";
  src = fetchgit {
    url = "https://github.com/gwern/mueval";
    sha256 = "88e8997630a46289a00afa5474ca708cd8c9a3e2d74da551d9a77d1ef494eaa6";
    rev = "d91fa64f057142f140d2f3c8e4e79d7a199bd924";
  };
  isLibrary = true;
  isExecutable = true;
  buildDepends = [
    base Cabal containers directory extensible-exceptions filepath hint
    mtl process QuickCheck show simple-reflect unix
  ];
  homepage = "https://github.com/gwern/mueval";
  description = "Safely evaluate pure Haskell expressions";
  license = stdenv.lib.licenses.bsd3;
}
