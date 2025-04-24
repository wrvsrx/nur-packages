{
  config,
  pkgs,
  lib,
  ...
}:
let
  cfg = config.goauthing;
  common-name = "goauthing";
  goauthing = pkgs.callPackage ../../pkgs/goauthing { };
in
{
  options.goauthing = {
    enable = lib.mkEnableOption "Enable goauthing service";
    package = lib.mkOption {
      type = lib.types.package;
      default = goauthing;
      description = "The goauthing package to use";
    };
    configFile = lib.mkOption {
      type = lib.types.path;
    };
    user = lib.mkOption {
      type = lib.types.str;
      default = common-name;
      description = "User to run goauthing as";
    };
    group = lib.mkOption {
      type = lib.types.str;
      default = common-name;
      description = "Group to run goauthing as";
    };
  };
  config.goauthing = lib.mkIf cfg.enable {
    systemd.services."goauthing" = {
      enable = true;
      unitConfig = {
        Description = "Authenticating utility for auth.tsinghua.edu.cn";
        After = "network-online.target";
      };
      serviceConfig = {
        Type = "simple";
        User = cfg.user;
        ExecStartPre = [
          "${cfg.goauthing}/bin/auth-thu --config-file ${cfg.configFile} deauth"
          "${cfg.goauthing}/bin/auth-thu --config-file ${cfg.configFile} auth"
        ];
        ExecStart = "${pkgs.auth-thu}/bin/auth-thu --config-file ${cfg.configFile} online";
        Restart = "always";
        RestartSec = 5;
      };
      wantedBy = [ "multi-user.target" ];
    };

    users.users.${cfg.user} = lib.mkIf (cfg.user == common-name) {
      description = "goauthing service user";
      isSystemUser = true;
      inherit (cfg) group;
    };

    users.groups.${cfg.group} = lib.mkIf (cfg.group == common-name) { };
  };
}
