{
  stdenv,
  unzip,
  source,
}:
stdenv.mkDerivation {
  inherit (source) pname version src;

  nativeBuildInputs = [ unzip ];

  buildCommand = ''
    unzip $src -d $out
  '';
}
