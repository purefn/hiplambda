{ mkDerivation, aeson, base, bytestring, hipbot, lens, mtl
, mueval, pointfree, pointful, postgresql-simple, process-extras
, resource-pool, safe, stdenv, text, transformers, utf8-string, wai
, wai-extra, wai-lens, warp, webcrank, webcrank-wai
}:
mkDerivation {
  pname = "hiplambda";
  version = "0.1.0.0";
  src = builtins.filterSource (path: type: baseNameOf path != ".git" && baseNameOf path != "dist") ./.;
  isLibrary = false;
  isExecutable = true;
  buildDepends = [
    aeson base bytestring hipbot lens mtl mueval pointfree
    pointful postgresql-simple process-extras resource-pool safe text
    transformers utf8-string wai wai-extra wai-lens warp webcrank
    webcrank-wai
  ];
  homepage = "https://github.com/purefn/hiplambda";
  description = "Haskell bot for HipChat";
  license = stdenv.lib.licenses.bsd3;
}
