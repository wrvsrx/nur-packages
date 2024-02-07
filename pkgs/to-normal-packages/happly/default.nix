{ stdenv
, meson
, ninja
, source
}:
stdenv.mkDerivation {
  inherit (source) pname src version;
  patches = [ ./pc.patch ];
  nativeBuildInputs = [
    meson
    ninja
  ];
}

