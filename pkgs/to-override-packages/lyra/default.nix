{
  stdenv,
  meson,
  ninja,
  source,
}:
stdenv.mkDerivation {
  inherit (source) pname src version;
  patches = [ ./meson.patch ];
  nativeBuildInputs = [
    meson
    ninja
  ];
}
