{
  description = "My personal NUR repository";
  inputs = {
    flake-lock.url = "github:wrvsrx/flake-lock";
    nixpkgs.follows = "flake-lock/nixpkgs";
    flake-parts.follows = "flake-lock/flake-parts";
    # TODO: remove it after nvfetcher's update is merged into nixpkgs
    nvfetcher = {
      url = "github:berberman/nvfetcher";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = inputs: inputs.flake-parts.lib.mkFlake { inherit inputs; } ({ withSystem, ... }:
    let
      inherit (import ./pkgs)
        pkgs-to-normal-packages
        pkgs-to-packages
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
          (pkgs-to-normal-packages prev) // {
            pythonPackagesExtensions = prev.pythonPackagesExtensions ++ [ (pkgs-to-python-modules prev) ];
            vimPlugins = prev.vimPlugins // (pkgs-to-vim-plugins prev);
          };
      };
      perSystem = { system, pkgs, ... }: rec {
        packages = pkgs-to-packages pkgs;
        checks = packages;
        formatter = pkgs.nixpkgs-fmt;
        devShells.default = pkgs.mkShell { nativeBuildInputs = [ inputs.nvfetcher.packages."${system}".default ]; };
      };
    });
}
