{ stdenvNoCC, source }:
stdenvNoCC.mkDerivation {
  inherit (source) pname version src;
  buildCommand = ''
    cp $src/compatibility_list.json $out
  '';
}
