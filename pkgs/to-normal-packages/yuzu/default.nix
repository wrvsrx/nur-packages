{ sources, pkgs }:
let
  inherit (pkgs) callPackage qt6Packages;
  nx_tzdb = callPackage ./nx_tzdb { source = sources.nx_tzdb; };
  compat-list = callPackage ./compat-list { source = sources.compat-list; };
  yuzu = qt6Packages.callPackage ./yuzu {
    source = sources.yuzu;
    inherit nx_tzdb compat-list;
  };
in
yuzu
