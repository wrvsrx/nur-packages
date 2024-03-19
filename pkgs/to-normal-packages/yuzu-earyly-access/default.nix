{
  qt6Packages,
  makeScopeWithSplicing',
  generateSplicesForMkScope,
  source,
}:
let
  compat-list = qt6Packages.callPackage ./compat-list.nix { };
  nx_tzdb = qt6Packages.callPackage ./nx_tzdb.nix { };
  mainline = qt6Packages.callPackage ./mainline.nix { inherit compat-list nx_tzdb; };
  early-access = qt6Packages.callPackage ./early-access { inherit mainline source; };
in
early-access
