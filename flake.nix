{
  description = "My personal NUR repository";
  inputs = {
    flake-lock.url = "github:wrvsrx/flake-lock";
    nixpkgs.follows = "flake-lock/nixpkgs";
    flake-parts.follows = "flake-lock/flake-parts";
    nvfetcher = {
      url = "github:berberman/nvfetcher";
      inputs.nixpkgs.follows = "flake-lock/nixpkgs";
      inputs.flake-utils.follows = "flake-lock/flake-utils";
      inputs.flake-compat.follows = "flake-lock/flake-compat";
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
        inherit (import ./pkgs)
          pkgs-to-packages
          pkgs-to-flat-packages
          pkgs-to-python-modules
          pkgs-to-vim-plugins
          pkgs-to-haskell-overlay
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
            importFlake =
              {
                path,
                inputs,
                narHash,
              }:
              let
                flake = import (path + "/flake.nix");
                outputs = flake.outputs (inputs // { self = result; });
                result = outputs // {
                  outPath = path;
                  inherit inputs outputs narHash;
                  _type = "flake";
                };
              in
              result;
            patchFlake =
              {
                flake,
                system,
                patchesToFetch,
              }:
              let
                initial-pkgs = import inputs.nixpkgs { inherit system; };
                src = initial-pkgs.applyPatches {
                  name = "patched-flake";
                  src = flake;
                  patches = [ (map initial-pkgs.fetchpatch patchesToFetch) ];
                };
                narHashDrv = initial-pkgs.stdenvNoCC.mkDerivation {
                  name = "narHash";
                  nativeBuildInputs = [ initial-pkgs.nix ];
                  unpackPhase = "true";
                  installPhase = ''
                    echo \"sha256- > $out
                    nix-hash --type sha256 --base64 ${src} >> $out
                    echo \" >> $out
                  '';
                };
                narHash = import "${narHashDrv}";
              in
              inputs.self.lib.importFlake {
                inherit narHash;
                inherit (flake) inputs;
                path = src;
              };
          };
          overlays.default =
            final: prev:
            let
              # it seems that using `extend` cause infinite evaluation of overlays
              pkgs = prev;
            in
            pkgs-to-flat-packages pkgs
            // {
              pythonPackagesExtensions = prev.pythonPackagesExtensions ++ [ (pkgs-to-python-modules pkgs) ];
              haskellPackages = prev.haskellPackages.extend (pkgs-to-haskell-overlay prev);
              vimPlugins = prev.vimPlugins // (pkgs-to-vim-plugins pkgs);
            };
        };
        perSystem =
          { system, pkgs, ... }:
          rec {
            _module.args.pkgs = import inputs.nixpkgs {
              inherit system;
              config.allowUnfree = true;
            };
            packages = pkgs-to-packages pkgs;
            checks = packages;
            formatter = pkgs.nixfmt-rfc-style;
            devShells.default = pkgs.mkShell {
              nativeBuildInputs = [
                inputs.nvfetcher.packages."${system}".default
                inputs.nix-update.packages."${system}".default
              ];
            };
          };
      }
    );
}
