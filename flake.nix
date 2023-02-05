{
  description = "My personal NUR repository";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    giraffe-wallpaper = {
      url = "github:wrvsrx/giraffe-wallpaper";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-utils.follows = "flake-utils";
    };
    osc52 = {
      url = "github:wrvsrx/osc52";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-utils.follows = "flake-utils";
    };
  };
  outputs =
    { self
    , nixpkgs
    , flake-utils
    , giraffe-wallpaper
    , osc52
    }:
    let
      toPackages = pkgs:
        import ./pkgs { inherit pkgs; }
        // {
          giraffe-wallpaper = giraffe-wallpaper.packages.${pkgs.system}.default;
          osc52 = osc52.packages.${pkgs.system}.default;
        };
    in
    flake-utils.lib.eachDefaultSystem
      (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in
      rec {
        packages = flake-utils.lib.filterPackages pkgs.system (toPackages pkgs);
        checks = packages;
        formatter = pkgs.nixpkgs-fmt;
      }
      ) // {
      overlays.default = final: prev: toPackages prev;
    };
}
