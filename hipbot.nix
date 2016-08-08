{ mkDerivation, aeson, base, bifunctors, blaze-builder, bytestring
, either, exceptions, fetchFromGitHub, http-client, http-client-tls
, http-types, jwt, lens, mtl, network-uri, postgresql-simple
, resource-pool, safe, stdenv, stm, text, time, transformers
, unordered-containers, utf8-string, wai, wai-lens, webcrank
, webcrank-wai, wreq
}:
mkDerivation {
  pname = "hipbot";
  version = "0.6";
  src = fetchFromGitHub {
    owner = "purefn";
    repo = "hipbot";
    sha256 = "10m1rnas92y0ykfrn75j9h6yl6gjsh7zjl4fmy6y9xxxyw4cynw7";
    rev = "a553a25e2aaf6ec2f1751b20cd40cbee839fb620";
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
