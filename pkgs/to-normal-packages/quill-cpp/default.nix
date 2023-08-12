{ lib
, stdenv
, cmake
, source
}:
stdenv.mkDerivation {
  inherit (source)
    pname src;
  version = lib.removePrefix "v" source.version;
  patches = [ ./pc.patch ];
  nativeBuildInputs = [
    cmake
  ];
}

