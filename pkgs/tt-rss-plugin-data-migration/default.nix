{ stdenvNoCC, source }:
stdenvNoCC.mkDerivation {
  inherit (source) pname version src;
  installPhase = ''
    mkdir -p $out/data_migration
    cp init.php $out/data_migration
  '';
}
