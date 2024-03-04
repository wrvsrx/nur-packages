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
  # we build metacubexd in following steps:
  # 
  # 1. get cache as a FOD during running `bun install --ignore-scripts` 
  # 2. use the cache to build `node_modules` (`bun install --force`) and `dist` (`bun run build`)
  # 
  # The reason why we use bun cache instead of `node_modules` as FOD is that
  # 
  # 1.  If we run `bun install` without `--ignore-scripts`, native libraries in node_modules will contain some store path as reference, which is not allowed in FOD.
  # 2.  If we run `bun install` with `--ignore-scripts`, we have to build native libraries in step 2. However, bun doesn't provide a method to only run install scripts without redownload like `npm rebuild`.
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
