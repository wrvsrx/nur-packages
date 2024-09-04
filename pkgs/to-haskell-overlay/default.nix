{ pkgs, to-sources }:
final: prev:
let
  sources = to-sources { inherit pkgs; };
  inherit (prev) callPackage;
  callIFD = import ../callIFD.nix;
in
rec {
  iCalendar =
    (pkgs.haskell.lib.overrideSrc prev.iCalendar { inherit (sources.iCalendar) version src; })
    .overrideAttrs
      (old: {
        meta = old.meta // {
          broken = false;
        };
      });
  osc52 = callIFD {
    inherit callPackage;
    source = sources.osc52;
  };
  task-utils = callIFD {
    inherit callPackage;
    source = sources.task-utils;
  };
  calendar-visualization = callIFD {
    inherit callPackage;
    source = sources.calendar-visualization;
    otherArgs = {
      inherit iCalendar;
    };
  };
}
