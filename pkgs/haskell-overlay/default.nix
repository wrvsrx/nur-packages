{ sources, pkgs }:
final: prev:
let
  inherit (prev) callPackage;
  callIFD = import ../callIFD.nix;
in
{
  osc52 = callIFD rec {
    inherit callPackage;
    source = sources.osc52;
    version = "0-unstable-" + source.date;
  };
  task-utils = callIFD rec {
    inherit callPackage;
    version = "0-unstable-" + source.date;
    source = sources.task-utils;
    transform =
      x:
      x.override (old: {
        doclayout = prev.doclayout_0_5;
      });
  };
}
