{
  description = "My personal NUR repository";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };
  };
  outputs = inputs: inputs.flake-parts.lib.mkFlake { inherit inputs; } ({ withSystem, ... }:
    let
      inherit (import ./pkgs) pkgs-to-packages pkgs-to-python-modules;
    in
    {
      systems = [ "x86_64-linux" ];
      flake = {
        templates = import ./templates;
        overlays.default = final: prev:
          (pkgs-to-packages prev) // {
            pythonPackagesExtensions = prev.pythonPackagesExtensions ++ [ (pkgs-to-python-modules prev) ];
          };
      };
      perSystem = { system, pkgs, ... }: rec {
        packages = pkgs-to-packages pkgs;
        checks = packages;
        formatter = pkgs.nixpkgs-fmt;
        devShells.default = pkgs.mkShell { nativeBuildInputs = [ pkgs.nvfetcher ]; };
      };
    });
}
