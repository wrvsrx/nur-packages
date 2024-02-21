{ source, lib, stdenvNoCC }:
stdenvNoCC.mkDerivation {
  inherit (source) pname src;
  version = lib.removePrefix "v" source.version;
  sourceRoot = ".";
  installPhase = ''
    mkdir -p $out
    cp -r ./* $out
  '';
}
