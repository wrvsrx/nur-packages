{ inputs }:
{ pkgs }:
{
  inherit (import inputs.linyinfeng { inherit pkgs; })
    wemeet
    ;
  inherit (import inputs.ilya-fedin { inherit pkgs; })
    qt5ct
    qt6ct
    ;
}
