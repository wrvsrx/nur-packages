{ pkgs }:
let
  inherit (pkgs) callPackage;
  sources = callPackage ./_sources/generated.nix { };
in
{
  auth-thu = callPackage ./auth-thu { };
  autodiff = callPackage ./autodiff { };
  inherit (callPackage ./noto-fonts-cjk { })
    noto-fonts-cjk-sans-fix-weight
    noto-fonts-cjk-serif-fix-weight;
  xdg-utils-patched = callPackage ./xdg-utils-patched { };
  pam_ssh_agent_auth = callPackage ./pam_ssh_agent_auth { inherit (pkgs) pam_ssh_agent_auth; };
  wpa_supplicant = callPackage ./wpa_supplicant { inherit (pkgs) wpa_supplicant; };
  xclip = callPackage ./xclip { inherit (pkgs) xclip; };
  wezterm = callPackage ./wezterm { inherit (pkgs) wezterm; };
  clipcat = callPackage ./clipcat { source = sources.clipcat; };
}
