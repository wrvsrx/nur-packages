# Test a local integrated niri revision

The default package keeps the working patch set until the integrated fork is
published. The `integratedFork` override instead builds the supplied source
without any of those three patches. It uses the same nixpkgs packaging hooks.

From this NUR checkout, with the candidate committed and checked out at HEAD:

```sh
export NIRI_REPO=/absolute/path/to/niri-checkout
export NIRI_REV=$(git -C "$NIRI_REPO" rev-parse HEAD)
# Known candidate; for a different lock file, use a temporary discovery hash
# (sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=) and replace it with
# the actual `got:` hash reported for cargoDeps before the final build.
export NIRI_CARGO_HASH=sha256-US27OLlBOyZcAK0SGH3VkFFp5BKjOui4RJHTrLBu9Us=
test_niri() {
  nix build --no-link --print-out-paths --impure --expr '
    let
      nur = builtins.getFlake (toString ./.);
      rev = builtins.getEnv "NIRI_REV";
      src = builtins.fetchGit { url = "file://${builtins.getEnv "NIRI_REPO"}"; inherit rev; };
    in nur.packages.x86_64-linux.niri.override {
      integratedFork = { inherit rev src; cargoHash = builtins.getEnv "NIRI_CARGO_HASH"; };
    }'
}
test_niri
```

This vendor hash was measured for the lock file at
`5a7453fa5d334cfc322852a55d39155f28be3204`. The corresponding local
`fetchGit` source has NAR hash `sha256-bZ//tAkA17Z88IeK9mpNWpJ8tySsLdvfK0yK0Dgvcks=`.

Do not deploy the discovery hash. If fetching dependencies fails before the
hash is reported, fix the fetch rather than assuming the old vendor hash fits.
The printed output path can be used to launch a separate headless compositor
without installing or switching the current desktop. Once the tested commit is
reachable from the remote, use the exact revision, its verified GitHub source
hash, and the tested vendor hash to change the package default. No local path
belongs in the published pin.
