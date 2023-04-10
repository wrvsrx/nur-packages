{
  description = "My personal NUR repository";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };
  outputs = inputs: inputs.flake-parts.lib.mkFlake { inherit inputs; } ({ withSystem, ... }:
    let
      defaultSystem = "x86_64-linux";
    in
    {
      imports = [ inputs.flake-parts.flakeModules.easyOverlay ];
      systems = [ defaultSystem ];
      flake.templates = import ./templates;
      perSystem = { system, pkgs, ... }: rec {
        packages = import ./pkgs { inherit pkgs; };
        overlayAttrs = packages;
        checks = packages;
        formatter = pkgs.nixpkgs-fmt;
        devShells.default = pkgs.mkShell { nativeBuildInputs = [ pkgs.nvfetcher ]; };
      };
    });
}
