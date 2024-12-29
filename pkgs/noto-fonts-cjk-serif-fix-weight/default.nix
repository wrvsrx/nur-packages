{ noto-fonts-cjk-serif, source }:
let
  ver = source.version;
  typeface = builtins.substring 0 (builtins.stringLength ver - 5) ver;
  version = builtins.substring (builtins.stringLength ver - 5) 5 ver;
in
noto-fonts-cjk-serif.overrideAttrs {
  inherit (source) src;
  inherit version;
  installPhase = ''
    install -m444 -Dt $out/share/fonts/opentype/noto-cjk ${typeface}/OTC/*.ttc
  '';
}
