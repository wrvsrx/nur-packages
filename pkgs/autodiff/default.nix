{ lib, stdenv, fetchFromGitHub, fetchpatch, cmake, eigen, catch2_3, python3 ? null }:

stdenv.mkDerivation rec {
  pname = "autodiff";
  version = "0.6.12";

  src = fetchFromGitHub {
    owner = "autodiff";
    repo = "autodiff";
    rev = "v${version}";
    sha256 = "pSZtfVvS1B/uRKuV2aHKd3YwFU6zq1hr/99PbQRzJOU=";
  };

  nativeBuildInputs = [ cmake eigen catch2_3 ] ++ (if python3 != null then [ python3.pkgs.pybind11 ] else [ ]);

  # Building the tests currently fails on AArch64 due to internal compiler
  # errors (with GCC 9.2):
  cmakeFlags = [ "-DRANGES_ENABLE_WERROR=OFF" ] ++ (if python3 != null then [ ] else [ "-DAUTODIFF_BUILD_PYTHON=OFF" ]);

  # checkTarget = "test";

  meta = with lib; {
    description = "automatic differentiation made easier for C++";
    homepage = "https://autodiff.github.io/";
    changelog = "https://github.com/autodiff/autodiff/releases/tag/v${version}";
    license = licenses.mit;
    platforms = platforms.all;
    maintainers = with maintainers; [ ];
  };
}
