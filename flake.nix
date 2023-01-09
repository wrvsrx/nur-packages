{
  description = "My personal NUR repository";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    clipcat = {
      url = "github:wrvsrx/clipcat";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-utils.follows = "flake-utils";
    };
  };
  outputs = { self, nixpkgs, flake-utils, clipcat }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in
      rec {
        packages = flake-utils.lib.filterPackages system (
          import ./pkgs { inherit pkgs; }
          // { inherit (clipcat.packages."${system}") clipcat; }
        );
        checks = packages;
        formatter = pkgs.nixpkgs-fmt;
      }
    );
}
