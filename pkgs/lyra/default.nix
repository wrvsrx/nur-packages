{
  stdenv,
  meson,
  ninja,
  source,
}:
stdenv.mkDerivation {
  inherit (source) pname src;
  version = "1.6.1-unstable-" + source.date;
  patches = [ ./meson.patch ];
  nativeBuildInputs = [
    meson
    ninja
  ];
}
