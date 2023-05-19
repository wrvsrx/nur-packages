{ haskellPackages, inkscape, imagemagick, stdenv, width ? 3840, height ? 2160, source }:
stdenv.mkDerivation {
  name = "giraffe-wallpaper";
  buildInputs = [
    haskellPackages.ghc
    inkscape
    imagemagick
  ];
  inherit (source) pname version src;
  buildPhase = ''
    runghc Main main.svg ${builtins.toString width} ${builtins.toString height}
  '';
  installPhase = ''
    mkdir -p $out/share
    cp output.bmp $out/share/wallpaper.bmp
  '';
}
