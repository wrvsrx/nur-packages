{
  buildNpmPackage,
  nodejs,
  bash,
  fetchFromGitHub,
}:
buildNpmPackage rec {
  pname = "sillytavern";
  version = "1.12.10";
  src = fetchFromGitHub {
    owner = "SillyTavern";
    repo = "SillyTavern";
    tag = version;
    sha256 = "sha256-eCGDqG0dLCkOPfSunzdskE9PbmXnii96X10KwIMUaeY=";
  };
  npmDepsHash = "sha256-KwPzpw85bCBfobARIlyaX4r0rRh3SlaGE7rNlPEvD6A=";
  buildPhase = "true";
  installPhase = ''
    mkdir -p $out/{bin,lib}
    mv * $out/lib
    rm $out/lib/node_modules/.package-lock.json
    cat > $out/bin/sillytavern <<- EOF
    #!${bash}/bin/bash

    ${nodejs}/bin/node $out/lib/server.js \$@
    EOF
    chmod +x $out/bin/sillytavern
  '';
}
