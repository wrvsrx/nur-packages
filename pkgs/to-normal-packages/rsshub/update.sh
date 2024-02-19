nix build .#rsshub.src
cp --no-preserve=mode result/package.json .
nix run nixpkgs#yarn install
nix run nixpkgs#yarn2nix > yarn.nix
rm result
