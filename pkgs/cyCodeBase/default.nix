{
  stdenv,
  meson,
  ninja,
  pkg-config,
  source,
}:
stdenv.mkDerivation {
  inherit (source) pname version src;
  postUnpack = "cp ${./meson.build} source/meson.build";
  nativeBuildInputs = [
    meson
    ninja
    pkg-config
  ];
}
