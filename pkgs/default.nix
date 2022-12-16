{ pkgs }:
let
  inherit (pkgs) callPackage;
in
{
  auth-thu = callPackage ./auth-thu { };
  autodiff = callPackage ./autodiff { };
  inherit (callPackage ./noto-fonts-cjk { })
    noto-fonts-cjk-sans-fix-weight
    noto-fonts-cjk-serif-fix-weight;
}
