{
  description = "flake template";

  inputs = {
    nur-wrvsrx.url = "github:wrvsrx/nur-packages";
    nixpkgs.follows = "nur-wrvsrx/nixpkgs";
    flake-parts.follows = "nur-wrvsrx/flake-parts";
  };

  outputs = inputs: inputs.flake-parts.lib.mkFlake { inherit inputs; } {
    systems = [ "x86_64-linux" ];
    perSystem = { pkgs, ... }: rec {
      packages.default = pkgs.callPackage ./default.nix { };
      devShells.default = pkgs.mkShell { inputsFrom = [ packages.default ]; };
    };
  };
}
