{
  description = "My personal NUR repository";
  inputs = {
    flake-lock.url = "github:wrvsrx/flake-lock";
    nixpkgs.follows = "flake-lock/nixpkgs";
    flake-parts.follows = "flake-lock/flake-parts";
    flake-utils.follows = "flake-lock/flake-utils";
    linyinfeng = {
      url = "github:linyinfeng/nur-packages";
      flake = false;
    };
    ilya-fedin = {
      url = "github:ilya-fedin/nur-repository";
      flake = false;
    };
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
          overlay
          ;
      in
      {
        systems = [ "x86_64-linux" ];
        flake = {
          templates = import ./templates;
          lib = import ./lib { inherit inputs; };
          overlays.default = overlay;
        };
        perSystem =
          { system, pkgs, ... }:
          {
            _module.args.pkgs = import inputs.nixpkgs {
              inherit system;
              config.allowUnfree = true;
            };
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
