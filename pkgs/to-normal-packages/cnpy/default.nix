{
  stdenv,
  cmake,
  source,
  zlib,
}:
stdenv.mkDerivation {
  inherit (source) pname src version;
  patches = [ ./pc.patch ];
  nativeBuildInputs = [ cmake ];
  propagatedBuildInputs = [ zlib ];
}
