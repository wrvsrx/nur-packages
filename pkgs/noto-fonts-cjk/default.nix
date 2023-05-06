{ stdenv
, stdenvNoCC
, lib
, fetchFromGitHub
, fetchurl
, cairo
, nixosTests
, pkg-config
, pngquant
, which
, imagemagick
, zopfli
, buildPackages
}:
let
  mkNotoCJK = { typeface, version, sha256 }:
    stdenvNoCC.mkDerivation {
      pname = "noto-fonts-cjk-${lib.toLower typeface}";
      inherit version;

      src = fetchFromGitHub {
        owner = "googlefonts";
        repo = "noto-cjk";
        rev = "${typeface}${version}";
        inherit sha256;
        sparseCheckout = [ "${typeface}/OTC" ];
      };

      installPhase = ''
        install -m444 -Dt $out/share/fonts/opentype/noto-cjk ${typeface}/OTC/*.ttc
      '';

      passthru.tests.noto-fonts = nixosTests.noto-fonts;

      meta = with lib; {
        description = "Beautiful and free fonts for CJK languages";
        homepage = "https://www.google.com/get/noto/help/cjk/";
        longDescription = ''
          Noto ${typeface} CJK is a ${lib.toLower typeface} typeface designed as
          an intermediate style between the modern and traditional. It is
          intended to be a multi-purpose digital font for user interface
          designs, digital content, reading on laptops, mobile devices, and
          electronic books. Noto ${typeface} CJK comprehensively covers
          Simplified Chinese, Traditional Chinese, Japanese, and Korean in a
          unified font family. It supports regional variants of ideographic
          characters for each of the four languages. In addition, it supports
          Japanese kana, vertical forms, and variant characters (itaiji); it
          supports Korean hangeul — both contemporary and archaic.
        '';
        license = licenses.ofl;
        platforms = platforms.all;
        maintainers = with maintainers; [ mathnerd314 emily ];
      };
    };
in
{
  noto-fonts-cjk-sans-fix-weight = mkNotoCJK {
    typeface = "Sans";
    version = "2.004";
    sha256 = "sha256-GXULnRPsIJRdiL3LdFtHbqTqSvegY2zodBxFm4P55to=";
  };

  noto-fonts-cjk-serif-fix-weight = mkNotoCJK {
    typeface = "Serif";
    version = "2.001";
    sha256 = "sha256-QZGnFXQlwfsOchKipimLczb8xV9BODMxpoxIXckoSYw=";
  };
}
