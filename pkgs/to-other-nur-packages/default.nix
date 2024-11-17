{ inputs }:
{ pkgs }:
let
  linyinfeng = import inputs.linyinfeng { inherit pkgs; };
  ilya-fedin = import inputs.ilya-fedin { inherit pkgs; };
in
{
  inherit (linyinfeng)
    wemeet
    lpac
    easylpac
    ;
  inherit (ilya-fedin)
    qt5ct
    qt6ct
    ;
}
