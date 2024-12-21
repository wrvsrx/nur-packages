{ source, stdenvNoCC }:
stdenvNoCC.mkDerivation {
  inherit (source) pname version src;
  installPhase = ''
    mkdir -p $out/share/$pname/cmake
    cp $pname.cmake $out/share/$pname/cmake/$pname-config.cmake
  '';
}
