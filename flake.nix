{
  description = "My personal NUR repository";
  inputs = {
    flake-lock.url = "github:wrvsrx/flake-lock";
    nixpkgs.follows = "flake-lock/nixpkgs";
    flake-parts.follows = "flake-lock/flake-parts";
    flake-utils.follows = "flake-lock/flake-utils";
    nix-update = {
      url = "github:Mic92/nix-update";
      inputs.nixpkgs.follows = "flake-lock/nixpkgs";
      inputs.flake-parts.follows = "flake-lock/flake-parts";
    };
  };
  outputs =
    inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } (
      { withSystem, inputs, ... }:
      let
        inherit (import ./pkgs { inherit inputs; })
          pkgs-to-packages
          pkgs-to-toplevel
          pkgs-to-python-modules
          pkgs-to-vim-plugins-overlay
          pkgs-to-haskell-overlay
          ;
      in
      {
        systems = [ "x86_64-linux" ];
        flake = {
          templates = import ./templates;
          lib = import ./lib { inherit inputs; };
          overlays.default =
            final: prev:
            pkgs-to-toplevel prev
            // {
              pythonPackagesExtensions = prev.pythonPackagesExtensions ++ [ (pkgs-to-python-modules prev) ];
              haskellPackages = prev.haskellPackages.extend (pkgs-to-haskell-overlay prev);
              vimPlugins = prev.vimPlugins.extend (pkgs-to-vim-plugins-overlay prev);
            };
        };
        perSystem =
          { system, pkgs, ... }:
          {
            checks =
              let
                pkgs' = pkgs-to-packages pkgs;
              in
              {
                rimePackagesCheck = pkgs'.rimePackages.withRimeDeps' (
                  with pkgs'.rimePackages;
                  [
                    rime-prelude
                    rime-fcitx5
                    rime-ice-flypy
                  ]
                );
              };
            packages = inputs.flake-utils.lib.flattenTree (pkgs-to-packages pkgs);
            formatter = pkgs.nixfmt-rfc-style;
            devShells.default = pkgs.mkShell {
              nativeBuildInputs = [
                pkgs.haskellPackages.nvfetcher
                inputs.nix-update.packages."${system}".default
              ];
            };
          };
      }
    );
}
