{ haskellPackages, inkscape, imagemagick, stdenv }:
{ width, height }:
stdenv.mkDerivation {
  name = "gen-giraffe-wallpaper";
  buildInputs = [
    (haskellPackages.ghcWithPackages (p: [ p.turtle ]))
    inkscape
    imagemagick
  ];
  src = ./.;
  buildPhase = ''
    runghc Main main.svg ${builtins.toString width} ${builtins.toString height}
  '';
  installPhase = ''
    mkdir -p $out/share
    cp output.png $out/share/wallpaper.png
  '';
}
