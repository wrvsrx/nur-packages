{
  description = "My personal NUR repository";
  inputs = {
    flake-lock.url = "github:wrvsrx/flake-lock";
    nixpkgs.follows = "flake-lock/nixpkgs";
    flake-parts.follows = "flake-lock/flake-parts";
    flake-utils.follows = "flake-lock/flake-utils";
  };
  outputs =
    inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } (
      { withSystem, inputs, ... }:
      let
        overlay = import ./pkgs/overlay.nix;
      in
      {
        systems = [ "x86_64-linux" ];
        flake = {
          templates = import ./templates;
          lib = import ./lib;
          overlays.default = overlay;
          nixosModules.default = ./nixos/modules;
        };
        perSystem =
          { system, pkgs, ... }:
          {
            _module.args.pkgs = import inputs.nixpkgs {
              inherit system;
              config.allowUnfree = true;
              overlays = [ overlay ];
            };
            packages = inputs.flake-utils.lib.flattenTree (
              let
                getAllPackages =
                  packageNames: packages:
                  let
                    toplevelPackageNames = packageNames._packageNames;
                    nestPackageNames = pkgs.lib.attrsets.filterAttrs (
                      name: value: name != "_packageNames"
                    ) packageNames;
                    toplevelPackages = pkgs.lib.attrsets.getAttrs toplevelPackageNames packages;
                    nestPackages = pkgs.lib.attrsets.mapAttrs (
                      nestName: nestPackageNames:
                      pkgs.lib.recurseIntoAttrs (getAllPackages nestPackageNames packages.${nestName})
                    ) nestPackageNames;
                  in
                  toplevelPackages // nestPackages;
              in
              getAllPackages pkgs."nur-wrvsrx"._packageNames pkgs
            );
            formatter = pkgs.nixfmt-rfc-style;
            devShells.default = pkgs.mkShell {
              nativeBuildInputs = with pkgs; [
                nvfetcher
                nix-update

                treefmt
                taplo
              ];
            };
          };
      }
    );
}
