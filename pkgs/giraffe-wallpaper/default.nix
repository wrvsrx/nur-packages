{ fetchFromGitHub, haskellPackages, inkscape, imagemagick, stdenv, width ? 3840, height ? 2160 }:
stdenv.mkDerivation {
  name = "giraffe-wallpaper";
  buildInputs = [
    haskellPackages.ghc
    inkscape
    imagemagick
  ];
  src = fetchFromGitHub {
    owner = "wrvsrx";
    repo = "giraffe-wallpaper";
    rev = "2240da13220a6c04a9d39a42c4da40f8b3327be8";
    sha256 = "ChGql5Or/J150c1lg2Pg6Cc/ZH0k69zMW1G2QTvy1wk=";
  };
  buildPhase = ''
    runghc Main main.svg ${builtins.toString width} ${builtins.toString height}
  '';
  installPhase = ''
    mkdir -p $out/share
    cp output.png $out/share/wallpaper.png
  '';
}
