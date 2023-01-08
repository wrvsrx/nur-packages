{ pkgs }:
let
  inherit (pkgs) callPackage;
in
{
  auth-thu = callPackage ./auth-thu { };
  autodiff = callPackage ./autodiff { };
  inherit (callPackage ./noto-fonts-cjk { })
    noto-fonts-cjk-sans-fix-weight
    noto-fonts-cjk-serif-fix-weight;
  giraffe-wallpaper = callPackage ./giraffe-wallpaper { };
  xdg-utils-patched = callPackage ./xdg-utils-patched { };
  pam_ssh_agent_auth = callPackage ./pam_ssh_agent_auth { inherit (pkgs) pam_ssh_agent_auth; };
  wpa_supplicant = callPackage ./wpa_supplicant { inherit (pkgs) wpa_supplicant; };
  osc52 = callPackage ./osc52 { };
  clipcat = callPackage ./clipcat { inherit (pkgs) clipcat; };
  kitty = callPackage ./kitty { inherit (pkgs) kitty; };
}
