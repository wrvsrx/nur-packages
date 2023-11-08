{
  description = "My personal NUR repository";
  inputs = {
    flake-lock.url = "github:wrvsrx/flake-lock";
    nixpkgs.follows = "flake-lock/nixpkgs";
    flake-parts.follows = "flake-lock/flake-parts";
  };
  outputs = inputs': inputs'.flake-parts.lib.mkFlake { inputs = inputs'; } ({ withSystem, inputs, ... }:
    let
      inherit (import ./pkgs)
        pkgs-to-packages
        pkgs-to-flat-packages
        pkgs-to-python-modules
        pkgs-to-vim-plugins
        ;
      templates = import ./templates;
    in
    {
      systems = [ "x86_64-linux" ];
      flake = {
        inherit templates;
        overlays.default = final: prev:
          (pkgs-to-flat-packages prev) // {
            pythonPackagesExtensions = prev.pythonPackagesExtensions ++ [ (pkgs-to-python-modules prev) ];
            vimPlugins = prev.vimPlugins // (pkgs-to-vim-plugins prev);
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
