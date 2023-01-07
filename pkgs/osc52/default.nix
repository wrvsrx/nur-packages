{ haskellPackages, fetchFromGitHub }:
let
  src = fetchFromGitHub {
    owner = "wrvsrx";
    repo = "osc52";
    rev = "5a72b6d9cd489e1d2398762591e7524ccf320a65";
    sha256 = "JAhA7bdzcRWokvHjMt5Hk6uwOkNFxalQ2xe0Z4bzRp4=";
  };
in
(haskellPackages.callPackage ./default-in-repo.nix { }).overrideAttrs (_: { inherit src; })
