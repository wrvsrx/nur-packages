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
      defaultSystem = "x86_64-linux";
    in
    {
      imports = [ inputs.flake-parts.flakeModules.easyOverlay ];
      systems = [ defaultSystem ];
      flake = withSystem defaultSystem ({ pkgs, ... }:
        let
          sources = pkgs.callPackage ./pkgs/_sources/generated.nix { };
        in
        {
          templates = import ./templates;
          overlays = {
            python = final: prev: {
              pythonPackagesExtensions = prev.pythonPackagesExtensions ++ [ (import ./pkgs/python-modules/python-packages.nix { inherit sources; }) ];
            };
          };
        });
      perSystem = { system, pkgs, ... }:
        rec {
          packages = import ./pkgs { inherit pkgs; };
          overlayAttrs = packages;
          checks = packages;
          formatter = pkgs.nixpkgs-fmt;
          devShells.default = pkgs.mkShell { nativeBuildInputs = [ pkgs.nvfetcher ]; };
        };
    });
}
