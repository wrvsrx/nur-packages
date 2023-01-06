{ haskellPackages, fetchFromGitHub }:
let
  src = fetchFromGitHub {
    owner = "wrvsrx";
    repo = "osc52";
    rev = "2b135a9f6d8a32eef5c467450bb141be7b4270bc";
    sha256 = "BRofg4SK5qvo5/Cr1Vx6FTOyuuDrRmZSr8ua71reIIo=";
  };
in
(haskellPackages.callPackage ./default-in-repo.nix { }).overrideAttrs (_: { inherit src; })
