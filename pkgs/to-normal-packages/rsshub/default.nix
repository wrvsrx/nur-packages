{ mkYarnPackage
, source
}:
mkYarnPackage {
  inherit (source) pname version src;
  packageJSON = ./package.json;
  yarnLock = ./yarn.lock;
  yarnNix = ./yarn.nix;
  buildPhase = "true";
  installPhase = ''
    yarn --offline pack --filename main.tgz
    mkdir -p $out
    tar xzf main.tgz --strip-components=1 -C $out
    ln -s $node_modules $out/node_modules
  '';
  distPhase = "true";
}
