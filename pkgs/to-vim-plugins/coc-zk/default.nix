{ stdenvNoCC
, mkYarnPackage
, source
}:
let
  tgz = mkYarnPackage {
    inherit (source) pname version src;
    packageJSON = ./package.json;
    yarnLock = ./yarn.lock;
    yarnNix = ./yarn.nix;
    buildPhase = ''
      yarn --offline build
      yarn --offline pack --filename main.tgz
    '';
    installPhase = ''
      mkdir -p $out
      cp main.tgz $out/$name.tgz
    '';
    distPhase = "true";
  };
in
stdenvNoCC.mkDerivation {
  inherit (source) pname version;
  src = "${tgz}/${tgz.name}.tgz";
  installPhase = ''
    mkdir -p $out
    mv * $out
  '';
}
