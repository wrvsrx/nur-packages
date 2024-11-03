{
  pkgs,
  to-sources,
}:
final: prev:
let
  sources = to-sources { inherit pkgs; };
  inherit (prev) callPackage;
  callIFD = import ../callIFD.nix;
in
rec {
  iCalendar = prev.iCalendar.overrideAttrs (old: {
    meta = old.meta // {
      broken = false;
    };
  });
  osc52 = callIFD {
    inherit callPackage;
    source = sources.osc52;
  };
  task-utils =
    (callIFD {
      inherit callPackage;
      source = sources.task-utils;
    }).override
      (old: {
        doclayout = pkgs.haskell.lib.overrideSrc old.doclayout {
          src = pkgs.fetchFromGitHub {
            owner = "jgm";
            repo = "doclayout";
            rev = "0.5";
            hash = "sha256-gTJhoM0WEF+5sbA3bEH+eYAjixNQf1oi2WbcBJpwLZg=";
          };
          version = "0.5";
        };
      });
  calendar-visualization = callIFD {
    inherit callPackage;
    source = sources.calendar-visualization;
    otherArgs = {
      inherit iCalendar;
    };
  };
}
