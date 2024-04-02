{
  mkPnpmPackage,
  stdenvNoCC,
  nodePackages,
  gitMinimal,
  source,
}:
let
  node-modules =
    (mkPnpmPackage {
      inherit (source) pname version src;
      installEnv.PUPPETEER_SKIP_DOWNLOAD = "1";
      # noDevDependencies = true;
    }).passthru.nodeModules;
in
stdenvNoCC.mkDerivation {
  inherit (source) pname version src;
  buildInputs = [
    nodePackages.pnpm
    gitMinimal
  ];
  buildPhase = ''
    ln -s ${node-modules}/node_modules node_modules
    pnpm build
  '';
  installPhase = ''
    cp -r . $out
  '';
}
