{ stdenvNoCC, source }:
stdenvNoCC.mkDerivation {
  inherit (source) pname version src;
  installPhase = ''
    mkdir -p $out
    cp init.php $out
  '';
}
