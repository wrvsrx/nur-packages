{ meson
, cmake
, ninja
, pkg-config
, haskellPackages
, stdenv
, fetchFromGitHub
}:
stdenv.mkDerivation rec {
  pname = "cuda-samples";
  version = "12.2";
  src = fetchFromGitHub {
    owner = "NVIDIA";
    repo = "cuda-samples";
    rev = "v${version}";
    sha256 = "sha256-lt6HpU1hmRf6pISpDnlJ38ovWuVOIFGR9DCC8rDYaiQ=";
    sparseCheckout = [ "Common" ];
  };
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
    (haskellPackages.ghcWithPackages (ps: with ps;[
      raw-strings-qq
      extra
    ]))
  ];
}
