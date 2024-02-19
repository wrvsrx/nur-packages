{ mkYarnModules
, stdenvNoCC
, source
}:
let
  a = mkYarnModules {
    inherit (source) pname version;
    yarnLock = ./yarn.lock;
    packageJSON = ./package.json;
  };
in
stdenvNoCC.mkDerivation {
  inherit (source) pname version src;
  unpackPhase = "true";
  installPhase = ''
    cp -r --no-preserve=mode $src $out
    ln -s ${a}/node_modules $out/node_modules
  '';
}
