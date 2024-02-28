{
  description = "My personal NUR repository";
  inputs = {
    flake-lock.url = "github:wrvsrx/flake-lock";
    pnpm2nix-nzbr = {
      url = "github:nzbr/pnpm2nix-nzbr";
      inputs.nixpkgs.follows = "flake-lock/nixpkgs";
      inputs.flake-utils.follows = "flake-lock/flake-utils";
    };
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
          importFlake = path: inputs:
            let
              flake = import (path + "/flake.nix");
              outputs = flake.outputs (inputs // { self = result; });
              result = outputs // { outPath = path; inherit inputs outputs; _type = "flake"; };
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
          let
            # it seems that using `extend` cause infinite evaluation of overlays
            pkgs = prev // (inputs.pnpm2nix-nzbr.overlays.default { } prev);
          in
          pkgs-to-flat-packages pkgs // {
            pythonPackagesExtensions = prev.pythonPackagesExtensions ++ [ (pkgs-to-python-modules pkgs) ];
            vimPlugins = prev.vimPlugins // (pkgs-to-vim-plugins pkgs);
          };
      };
      perSystem = { system, pkgs, ... }: rec {
        _module.args.pkgs = import inputs.nixpkgs {
          inherit system;
          config.allowUnfree = true;
          overlays = [ inputs.pnpm2nix-nzbr.overlays.default ];
        };
        packages = pkgs-to-packages pkgs;
        checks = packages;
        formatter = pkgs.nixpkgs-fmt;
        devShells.default = pkgs.mkShell { nativeBuildInputs = [ pkgs.nvfetcher ]; };
      };
    });
}

