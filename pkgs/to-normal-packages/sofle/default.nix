{
  callPackage,
  west2nix,
  zephyr-nix,
  pyproject-nix,
  source,
}:
let
  pyproject-nix' = callPackage pyproject-nix { };
  zephyr-nix' = callPackage zephyr-nix { pyproject-nix = pyproject-nix'; };
  west2nix' = callPackage west2nix { };
in
(callPackage (source.src) {
  zephyr = zephyr-nix';
  inherit (west2nix') mkWestDependencies;
}).packages.default
