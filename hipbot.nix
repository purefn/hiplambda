{ mkDerivation, aeson, base, bifunctors, blaze-builder, bytestring
, either, exceptions, fetchgit, http-client, http-client-tls
, http-types, jwt, lens, mtl, network-uri, postgresql-simple
, resource-pool, safe, stdenv, stm, text, time, transformers
, unordered-containers, utf8-string, wai, wai-lens, webcrank
, webcrank-wai, wreq
}:
mkDerivation {
  pname = "hipbot";
  version = "0.6";
  src = fetchgit {
    url = "https://github.com/purefn/hipbot.git";
    sha256 = "729f48a9b99fd6a0205722b20e7d3e2164b4b5fd5563361ef3de8d555936170d";
    rev = "9330c39a943c528ef6e4ec88324bf1d6634d2215";
  };
  libraryHaskellDepends = [
    aeson base bifunctors blaze-builder bytestring either exceptions
    http-client http-client-tls http-types jwt lens mtl network-uri
    postgresql-simple resource-pool safe stm text time transformers
    unordered-containers utf8-string wai wai-lens webcrank webcrank-wai
    wreq
  ];
  jailbreak = true;
  homepage = "https://github.com/purefn/hipbot";
  description = "A library for building HipChat Bots";
  license = stdenv.lib.licenses.bsd3;
}
