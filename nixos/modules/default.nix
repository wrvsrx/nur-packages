{
  disabledModules = [
    "services/misc/taskchampion-sync-server.nix"
  ];
  imports = [
    ./taskchampion-sync-server.nix
  ];
}
