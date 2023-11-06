{ pkgs, to-sources }:
let
  inherit (pkgs) callPackage;
  sources = to-sources { inherit pkgs; };
in
{
  pam_ssh_agent_auth = callPackage ./pam_ssh_agent_auth { inherit (pkgs) pam_ssh_agent_auth; };
  xclip = callPackage ./xclip { inherit (pkgs) xclip; source = sources.xclip; };
  clipcat = callPackage ./clipcat { source = sources.clipcat; };
  lyra = callPackage ./lyra { source = sources.lyra; };
  calibre = callPackage ./calibre { inherit (pkgs) calibre; };
}
