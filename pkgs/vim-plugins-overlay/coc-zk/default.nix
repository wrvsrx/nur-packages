{
  mkYarnPackage,
  fetchYarnDeps,
  source,
}:
mkYarnPackage {
  inherit (source) pname src;
  packageJSON = ./package.json;
  offlineCache = fetchYarnDeps { yarnLock = ./yarn.lock; };
  version = "0-unstable-" + source.date;
  buildPhase = "yarn --offline build";
  installPhase = ''
    yarn --offline pack --filename main.tgz
    mkdir -p $out
    tar xzf main.tgz --strip-components=1 -C $out
  '';
  distPhase = "true";
}
