{ mkYarnPackage, source }:
mkYarnPackage {
  inherit (source) pname src;
  version = "0-unstable-" + source.date;
  buildPhase = "yarn --offline build";
  installPhase = ''
    yarn --offline pack --filename main.tgz
    mkdir -p $out
    tar xzf main.tgz --strip-components=1 -C $out
  '';
  distPhase = "true";
}
