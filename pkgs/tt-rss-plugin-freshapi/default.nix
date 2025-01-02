{ stdenvNoCC, source }:
stdenvNoCC.mkDerivation {
  inherit (source) pname src version;
  installPhase = ''
    mkdir -p $out/freshapi
    cp -r api init.php $out/freshapi
  '';
}
