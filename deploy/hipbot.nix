{ mkDerivation, aeson, base, bifunctors, blaze-builder, bytestring
, either, exceptions, http-client, http-client-tls, http-types, jwt
, lens, mtl, network-uri, postgresql-simple, resource-pool, safe
, stdenv, stm, text, time, transformers, unordered-containers
, utf8-string, wai, wai-lens, webcrank, webcrank-wai, wreq
}:
mkDerivation {
  pname = "hipbot";
  version = "0.5";
  revision = "1";
  sha256 = "0acy9bp2dwszd01l514nx2crdxgb356k18pm9ravddljxr24n1hs";
  editedCabalFile = "6ac1673be45c18dc010eeeef508a021ec9fef4e0a4e05864733f91aec8508ab8";
  buildDepends = [
    aeson base bifunctors blaze-builder bytestring either exceptions
    http-client http-client-tls http-types jwt lens mtl network-uri
    postgresql-simple resource-pool safe stm text time transformers
    unordered-containers utf8-string wai wai-lens webcrank webcrank-wai
    wreq
  ];
  homepage = "https://github.com/purefn/hipbot";
  description = "A library for building HipChat Bots";
  license = stdenv.lib.licenses.bsd3;
}
