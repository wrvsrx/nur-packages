{
  stdenv,
  cmake,
  lib,
  source,
}:
stdenv.mkDerivation {
  inherit (source) pname src version;
  nativeBuildInputs = [ cmake ];
  cmakeFlags = [ (lib.cmakeFeature "CMAKE_POLICY_VERSION_MINIMUM" "3.5") ];
}
