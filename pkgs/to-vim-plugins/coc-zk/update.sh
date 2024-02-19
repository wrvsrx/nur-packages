nix build .#coc-zk.src
cp --no-preserve=mode result/package.json .
cp --no-preserve=mode result/yarn.lock .
nix run nixpkgs#yarn2nix > yarn.nix
rm result
