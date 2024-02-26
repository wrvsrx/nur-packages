{ pkgs, to-sources }:
let
  inherit (pkgs) callPackage;
  sources = to-sources { inherit pkgs; };
in
{
  pam_ssh_agent_auth = callPackage ./pam_ssh_agent_auth { inherit (pkgs) pam_ssh_agent_auth; };
  xclip = callPackage ./xclip { inherit (pkgs) xclip; source = sources.xclip; };
  lyra = callPackage ./lyra { source = sources.lyra; };
  spdlog = callPackage ./spdlog { inherit (pkgs) spdlog; source = sources.spdlog; };
  calibre = pkgs.qt6Packages.callPackage ./calibre { podofo = pkgs.podofo010; source = sources.calibre; };
}
