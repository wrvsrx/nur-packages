{ noto-fonts-cjk-sans, source }:
let
  ver = source.version;
  typeface = builtins.substring 0 (builtins.stringLength ver - 5) ver;
  version = builtins.substring (builtins.stringLength ver - 5) 5 ver;
in
noto-fonts-cjk-sans.overrideAttrs {
  inherit (source) src;
  inherit version;
  installPhase = ''
    install -m444 -Dt $out/share/fonts/opentype/noto-cjk ${typeface}/OTC/*.ttc
  '';
}
