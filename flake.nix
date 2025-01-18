{
  description = "My personal NUR repository";
  inputs = {
    flake-lock.url = "github:wrvsrx/flake-lock";
    nixpkgs.follows = "flake-lock/nixpkgs";
    flake-parts.follows = "flake-lock/flake-parts";
    flake-utils.follows = "flake-lock/flake-utils";
    nvfetcher = {
      url = "github:berberman/nvfetcher";
      inputs.nixpkgs.follows = "flake-lock/nixpkgs";
      inputs.flake-utils.follows = "flake-lock/flake-utils";
      inputs.flake-compat.follows = "flake-lock/flake-compat";
    };
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
        overlay = import ./pkgs/overlay.nix { inherit inputs; };
      in
      {
        systems = [ "x86_64-linux" ];
        flake = {
          templates = import ./templates;
          lib = import ./lib { inherit inputs; };
          overlays.default = overlay;
          nixosModules.default = ./modules;
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
                inputs.nvfetcher.packages."${system}".default
                inputs.nix-update.packages."${system}".default
                treefmt
                taplo
              ];
            };
          };
      }
    );
}
