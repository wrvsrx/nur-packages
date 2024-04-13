{ pkgs, to-sources }:
final: prev:
let
  sources = to-sources { inherit pkgs; };
  inherit (prev) callPackage;
  callIFD = import ../callIFD.nix;
in
rec {
  iCalendar =
    (pkgs.haskell.lib.overrideSrc prev.iCalendar {
      src = pkgs.fetchFromGitHub {
        owner = "wrvsrx";
        repo = "iCalendar";
        rev = "e2f5f700294ae0d205b6bf2e372f3a99f801d7fc";
        hash = "sha256-e2aZr8Vh/HJnTV8GwIDMzGTZBZdYf72NtapHElHw0gg=";
      };
    }).overrideAttrs
      (old: {
        meta = old.meta // {
          broken = false;
        };
      });
  osc52 = callIFD {
    inherit callPackage;
    source = sources.osc52;
  };
  taskwarrior-utils = callIFD {
    inherit callPackage;
    source = sources.taskwarrior-utils;
  };
  calendar-visualization = callIFD {
    inherit callPackage;
    source = sources.calendar-visualization;
    otherArgs = {
      inherit iCalendar;
    };
  };
}
