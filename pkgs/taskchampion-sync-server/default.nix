{
  taskchampion-sync-server,
  source,
  lib,
}:
let
  version = lib.removePrefix "v" source.version;
in
taskchampion-sync-server.overrideAttrs (old: rec {
  inherit (source) src;
  inherit version;
  cargoDeps = old.cargoDeps.overrideAttrs {
    inherit src;
    outputHash = "sha256-S90n1C82r+7tdvxXOee5wFDYqgFGBWgPpRdHXR0lIpk=";
  };
})
