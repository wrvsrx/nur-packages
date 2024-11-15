{ inputs }:
{ pkgs }:
let
  linyinfeng = import inputs.linyinfeng { inherit pkgs; };
  ilya-fedin = import inputs.ilya-fedin { inherit pkgs; };
in
rec {
  inherit (linyinfeng)
    wemeet
    lpac
    ;
  easylpac = linyinfeng.easylpac.overrideAttrs {
    postInstall = ''
      ln -s ${lpac}/bin/lpac $out/bin/lpac
    '';
  };
  inherit (ilya-fedin)
    qt5ct
    qt6ct
    ;
}
