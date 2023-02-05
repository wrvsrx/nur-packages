{
  description = "My personal NUR repository";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs =
    { self
    , nixpkgs
    , flake-utils
    }:
    let
      toPackages = pkgs: import ./pkgs { inherit pkgs; };
    in
    flake-utils.lib.eachDefaultSystem
      (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in
      rec {
        packages = flake-utils.lib.filterPackages pkgs.system (toPackages pkgs);
        checks = packages;
        formatter = pkgs.nixpkgs-fmt;
      }
      ) // {
      overlays.default = final: prev: toPackages prev;
    };
}
