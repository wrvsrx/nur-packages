{
  qt6Packages,
  makeScopeWithSplicing',
  generateSplicesForMkScope,
  source,
}:
let
  compat-list = qt6Packages.callPackage ./compat-list.nix { };
  nx_tzdb = qt6Packages.callPackage ./nx_tzdb.nix { };
  early-access = qt6Packages.callPackage ./early-access.nix { inherit compat-list nx_tzdb source; };
in
early-access
