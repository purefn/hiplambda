{ mkDerivation, base, bytestring, exceptions, lens, mtl, stdenv
, unix-compat, unordered-containers, wai, wai-lens, webcrank
, webcrank-dispatch
}:
mkDerivation {
  pname = "webcrank-wai";
  version = "0.2.1";
  sha256 = "13db2hpyvzpx9i43d8pryq7f87zlajpfpf0h6biva28l9qamy1yv";
  buildDepends = [
    base bytestring exceptions lens mtl unix-compat
    unordered-containers wai wai-lens webcrank webcrank-dispatch
  ];
  homepage = "https://github.com/webcrank/webcrank-wai";
  description = "Build a WAI Application from Webcrank Resources";
  license = stdenv.lib.licenses.bsd3;
}
