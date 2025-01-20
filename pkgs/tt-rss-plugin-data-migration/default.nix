{ stdenvNoCC, source }:
stdenvNoCC.mkDerivation {
  inherit (source) pname src;
  version = "0-unstable-" + source.date;
  installPhase = ''
    mkdir -p $out/data_migration
    cp init.php $out/data_migration
  '';
}
