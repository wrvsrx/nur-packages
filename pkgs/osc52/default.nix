{ haskellPackages, fetchFromGitHub }:
let
  src = fetchFromGitHub {
    owner = "wrvsrx";
    repo = "osc52";
    rev = "3cec9d8cddde250529bf9696b6f15faf047e53d2";
    sha256 = "WynHo7s817Z8W/Ob0k0HiWagpYvIg9lO8E2OpzuiQCQ=";
  };
in
(haskellPackages.callPackage ./default-in-repo.nix { }).overrideAttrs (_: { inherit src; })
