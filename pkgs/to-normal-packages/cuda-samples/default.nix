{
  meson,
  cmake,
  ninja,
  pkg-config,
  haskellPackages,
  stdenv,
  source,
}:
stdenv.mkDerivation {
  inherit (source) pname src;
  version = "12.2";
  patches = [
    ./meson.patch
    ./cpp20.patch
  ];
  generateMesonPhase = ''
    runghc Main > meson.build
  '';
  preConfigurePhases = [ "generateMesonPhase" ];
  nativeBuildInputs = [
    meson
    cmake
    ninja
    pkg-config
    (haskellPackages.ghcWithPackages (
      ps: with ps; [
        raw-strings-qq
        extra
      ]
    ))
  ];
}
