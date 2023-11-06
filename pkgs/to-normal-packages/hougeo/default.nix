{ stdenv
, cmake
, source
}:
stdenv.mkDerivation {
  inherit (source) pname src version;
  patches = [ ./pc.patch ];
  nativeBuildInputs = [
    cmake
  ];
}

