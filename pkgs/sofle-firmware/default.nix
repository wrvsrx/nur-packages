{
  callPackage,
  west2nix,
  zephyr-nix,
  pyproject-nix,
  source,
}:
let
  west2nix' = callPackage west2nix { };
  pyproject-nix' = callPackage pyproject-nix { };
  zephyr-nix' = callPackage zephyr-nix {
    pyproject-nix = pyproject-nix';
    zephyr-src = "";
  };
in
(callPackage (source.src) {
  zephyr = zephyr-nix';
  inherit (west2nix') mkWest2nixHook;
}).packages.default.overrideAttrs
  (old: {
    # record IFD as buildInputs to avoid gc
    buildInputs = (old.buildInputs or [ ]) ++ [
      west2nix
      zephyr-nix
      pyproject-nix
      source.src
    ];
  })
