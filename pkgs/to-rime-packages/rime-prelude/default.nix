{
  stdenvNoCC,
  source,
}:
stdenvNoCC.mkDerivation {
  inherit (source) pname src version;
  installPhase = ''
    mkdir -p $out/share/rime-data/
    cp *.yaml $out/share/rime-data/
  '';
}
