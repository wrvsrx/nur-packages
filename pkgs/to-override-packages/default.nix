{ pkgs, to-sources }:
let
  inherit (pkgs) callPackage;
  sources = to-sources { inherit pkgs; };
in
rec {
  pam_ssh_agent_auth = callPackage ./pam_ssh_agent_auth { inherit (pkgs) pam_ssh_agent_auth; };
  xclip = callPackage ./xclip {
    inherit (pkgs) xclip;
    source = sources.xclip;
  };
  lyra = callPackage ./lyra { source = sources.lyra; };
  wezterm = callPackage ./wezterm {
    source = sources.wezterm;
    inherit (pkgs) wezterm;
  };
  librime = callPackage ./librime { inherit (pkgs) librime; };
  fcitx5-rime = callPackage ./fcitx5-rime {
    inherit (pkgs) fcitx5-rime;
    inherit librime;
  };
  neovim-unwrapped = callPackage ./neovim-unwrapped {
    inherit (pkgs) neovim-unwrapped;
  };
}
