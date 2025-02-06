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
          overlays.default = overlay;
          nixosModules.default = ./nixos/modules;
        };
        perSystem =
          { pkgs, ... }:
          {
            packages = inputs.flake-utils.lib.flattenTree (import ./. { inherit pkgs; });
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
