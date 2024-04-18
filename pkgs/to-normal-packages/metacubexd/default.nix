{
  source,
  nodePackages,
  vips,
  lib,
  pkg-config,
  python3,
  zlib,
  mkPnpmPackage,
}:
let
  version = lib.removePrefix "v" source.version;
in
mkPnpmPackage {
  inherit (source) pname src;
  inherit version;
  inherit (nodePackages) nodejs;
  installEnv = {
    # otherwise, node-gyp will try to download node headers from internet
    npm_config_nodedir = "${nodePackages.nodejs}";
  };
  extraBuildInputs = [
    nodePackages.node-gyp
    pkg-config
    python3
    vips
    zlib
  ];
  noDevDependencies = true;
}
