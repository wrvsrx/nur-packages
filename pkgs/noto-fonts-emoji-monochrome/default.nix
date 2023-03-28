{ stdenvNoCC
, lib
, nixosTests
, source
}:
stdenvNoCC.mkDerivation {
  inherit (source) pname version src;

  installPhase = ''
    install -m444 -Dt $out/share/fonts/truetype/noto-emoji-monochrome noto-emoji/NotoEmoji-VariableFont_wght.ttf
  '';

  passthru.tests.noto-fonts = nixosTests.noto-fonts;

  meta = with lib; {
    description = "Noto Emoji is an open source font that has you covered for all your emoji needs, including support for the latest Unicode emoji specification. It has multiple weights and features thousands of emoji.";
    homepage = "https://fonts.google.com/noto/specimen/Noto+Emoji";
    license = licenses.ofl;
    platforms = platforms.all;
    maintainers = [];
  };
}
