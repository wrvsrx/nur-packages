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
      cp ${lpac}/bin/lpac $out/bin/
    '';
  };
  inherit (ilya-fedin)
    qt5ct
    qt6ct
    ;
}
