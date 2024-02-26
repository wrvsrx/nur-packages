{ fetchurl
, callPackage
}:
callPackage
  (fetchurl {
    url = "https://raw.githubusercontent.com/NickCao/nixpkgs/d8e76e5d6b9a4fd20ad71462d7380ec6c7160f25/pkgs/development/python-modules/nvchecker/default.nix";
    hash = "sha256-cHC4ewYRdu5inYOLHIaqi25wSLhH2lDYWxH/6O3/9lU=";
  })
{ }
