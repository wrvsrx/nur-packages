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
        lib = {
          # this function is modified from nix official implementation
          # https://github.com/NixOS/nix/blob/56dc6ed8410510033b835d48b3bd22766e8349a0/src/libexpr/flake/call-flake.nix#L7-L61
          importFlake = flake: inputs:
            let
              flake = import (flake + "/flake.nix");
              outputs = flake.outputs (inputs // { self = result; });
              result = outputs // { outPath = flake; inherit inputs outputs; _type = "flake"; };
            in
            result;
          patchFlake = flake: system: patchesToFetch:
            let
              initial-pkgs = import inputs.nixpkgs { inherit system; };
              src = initial-pkgs.applyPatches {
                name = "patched-flake";
                src = flake;
                patches = [ (map initial-pkgs.fetchpatch patchesToFetch) ];
              };
            in
            inputs.self.lib.importFlake src flake.inputs;
        };
        overlays.default = final: prev:
          (pkgs-to-flat-packages prev) // {
            pythonPackagesExtensions = prev.pythonPackagesExtensions ++ [ (pkgs-to-python-modules prev) ];
            vimPlugins = prev.vimPlugins // (pkgs-to-vim-plugins prev);
          };
      };
      perSystem = { system, pkgs, ... }: rec {
        _module.args.pkgs = import inputs.nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };
        packages = pkgs-to-packages pkgs;
        checks = packages;
        formatter = pkgs.nixpkgs-fmt;
        devShells.default = pkgs.mkShell { nativeBuildInputs = [ pkgs.nvfetcher ]; };
      };
    });
}
