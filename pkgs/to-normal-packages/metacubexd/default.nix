{ stdenv
, bun
, nodePackages
, vips
, lib
, source
, pkg-config
, python3
, zlib
}:
let
  inherit (source) pname src;
  version = lib.removePrefix "v" source.version;
  node_modules_cache = stdenv.mkDerivation {
    pname = pname + "_cache";
    inherit version src;
    nativeBuildInputs = [ bun ];
    impureEnvVars = lib.fetchers.proxyImpureEnvVars;
    buildPhase = ''
      mkdir cache
      export XDG_CACHE_HOME=$PWD/cache
      bun install --frozen-lockfile --verbose --production --ignore-scripts
    '';
    installPhase = "cp -r cache $out";
    dontConfigure = true;
    outputHash = "sha256-+rMPDEM4f+DVDkTLs4cKa0167ZE05R52OiAW+CfO350=";
    outputHashAlgo = "sha256";
    outputHashMode = "recursive";
    dontFixup = true;
  };
  out = stdenv.mkDerivation {
    inherit pname version src;
    nativeBuildInputs = [
      bun
      nodePackages.node-gyp
      nodePackages.nodejs
      pkg-config
      python3
    ];
    buildInputs = [
      vips
      zlib
    ];
    patches = [ ./husky.patch ];
    buildPhase = ''
      cp -r ${node_modules_cache} cache
      export XDG_CACHE_HOME=$PWD/cache
      chmod 755 $PWD/cache/.bun/install/cache
      bun install --frozen-lockfile --verbose --production
      bun run build
    '';
    installPhase = "cp -r dist $out";
  };
in
out
