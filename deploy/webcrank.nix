{ mkDerivation, attoparsec, base, blaze-builder, bytestring
, case-insensitive, either, exceptions, http-date, http-media
, http-types, lens, mtl, semigroups, stdenv, tasty, tasty-hunit
, tasty-quickcheck, text, transformers, unordered-containers
, utf8-string
}:
mkDerivation {
  pname = "webcrank";
  version = "0.2.2";
  revision = "1";
  sha256 = "1rgvpp2526lmly2fli65mygplfc6wzqcw5fkn7gq4fcrmql2cisj";
  editedCabalFile = "487831902c68484790108f97e32098dad9711eb15e0729b9ab1ba009e8fd5747";
  buildDepends = [
    attoparsec base blaze-builder bytestring case-insensitive either
    exceptions http-date http-media http-types lens mtl semigroups text
    transformers unordered-containers utf8-string
  ];
  testDepends = [
    attoparsec base bytestring case-insensitive exceptions http-date
    http-media http-types lens mtl tasty tasty-hunit tasty-quickcheck
    unordered-containers
  ];
  homepage = "https://github.com/webcrank/webcrank.hs";
  description = "Webmachine inspired toolkit for building http applications and services";
  license = stdenv.lib.licenses.bsd3;
}
