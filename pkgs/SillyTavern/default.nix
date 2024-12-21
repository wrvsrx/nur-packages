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
  buildPhase = "true";
  installPhase = ''
    mkdir -p $out/{bin,lib}
    mv * $out/lib
    cat > $out/bin/SillyTavern <<- EOF
    #!${bash}/bin/bash

    ${nodejs}/bin/node $out/lib/server.js \$@
    EOF
    chmod +x $out/bin/SillyTavern
  '';
}
