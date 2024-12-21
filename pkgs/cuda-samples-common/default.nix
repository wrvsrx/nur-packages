{
  meson,
  cmake,
  ninja,
  pkg-config,
  haskellPackages,
  cudaPackages,
}:
cudaPackages.backendStdenv.mkDerivation {
  pname = "cuda-samples-common";
  inherit (cudaPackages.cuda-samples) version src;
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
