{
  callPackage,
  keymap-drawer,
  source,
}:
let
  lock = builtins.fromJSON (builtins.readFile "${source.src}/flake.lock");
  toSource =
    nodeName:
    fetchTarball {
      url = "https://github.com/${lock.nodes.${nodeName}.locked.owner}/${
        lock.nodes.${nodeName}.locked.repo
      }/archive/${lock.nodes.${nodeName}.locked.rev}.tar.gz";
      sha256 = lock.nodes.${nodeName}.locked.narHash;
    };
  west2nix = callPackage (toSource "west2nix") { };
  pyproject-nix = callPackage (toSource "pyproject-nix") { };
  zephyr-nix = callPackage (toSource "zephyr-nix") {
    inherit pyproject-nix;
  };
in
(callPackage (source.src) {
  inherit keymap-drawer;
  zephyr = zephyr-nix;
  inherit (west2nix) mkWest2nixHook;
}).packages.default.overrideAttrs
  (old: rec {
    inherit (source) pname;
    version = "0-unstable-" + source.date;
    name = "${pname}-${version}";
    # record IFD as buildInputs to avoid gc
    buildInputs = (old.buildInputs or [ ]) ++ [
      source.src
    ];
  })
