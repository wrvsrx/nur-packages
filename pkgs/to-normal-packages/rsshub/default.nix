{ mkPnpmPackage
, stdenvNoCC
, source
}:
let
  node-modules = (mkPnpmPackage {
    inherit (source) pname version src;
    installEnv.PUPPETEER_SKIP_DOWNLOAD = "1";
    noDevDependencies = true;
  }).passthru.nodeModules;
in
stdenvNoCC.mkDerivation {
  inherit (source) pname version src;
  installPhase = ''
    mkdir -p $out
    ln -s ${node-modules}/node_modules $out/node_modules
    cp -r lib $out/lib
  '';
}
