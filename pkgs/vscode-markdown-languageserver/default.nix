{
  buildNpmPackage,
  importNpmLock,
  nodejs,
  bash,
  source,
}:
buildNpmPackage {
  inherit (source) pname version src;
  inherit (importNpmLock) npmConfigHook;
  npmDeps = importNpmLock { npmRoot = source.src; };
  buildPhase = "npm run dist";
  installPhase = ''
    mkdir -p $out/bin
    mv dist $out/dist
    cat > $out/bin/$pname <<- EOF
    #!${bash}/bin/bash

    ${nodejs}/bin/node $out/dist/node/workerMain.js \$@
    EOF
    chmod +x $out/bin/$pname
  '';
}
