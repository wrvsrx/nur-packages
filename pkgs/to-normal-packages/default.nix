{ pkgs, to-sources }:
let
  inherit (pkgs) callPackage haskellPackages;
  sources = to-sources { inherit pkgs; };
in
rec {
  auth-thu = callPackage ./auth-thu { };
  autodiff = callPackage ./autodiff { source = sources.autodiff; };
  inherit (callPackage ./noto-fonts-cjk { })
    noto-fonts-cjk-sans-fix-weight
    noto-fonts-cjk-serif-fix-weight;
  xdg-utils-patched = callPackage ./xdg-utils-patched { };
  pam_ssh_agent_auth = callPackage ./pam_ssh_agent_auth { inherit (pkgs) pam_ssh_agent_auth; };
  xclip = callPackage ./xclip { inherit (pkgs) xclip; source = sources.xclip; };
  clipcat = callPackage ./clipcat { source = sources.clipcat; };
  giraffe-wallpaper = callPackage ./giraffe-wallpaper { source = sources.giraffe-wallpaper; };
  osc52 = haskellPackages.callPackage ./osc52 { source = sources.osc52; };
  taskwarrior-utils = haskellPackages.callPackage ./taskwarrior-utils { source = sources.taskwarrior-utils; };
  noto-fonts-emoji-monochrome = callPackage ./noto-fonts-emoji-monochrome { source = sources.noto-fonts-emoji-monochrome; };
  cyCodeBase = callPackage ./cyCodeBase { source = sources.cyCodeBase; };
  quill-cpp = callPackage ./quill-cpp { source = sources.quill-cpp; };
  lyra = callPackage ./lyra { source = sources.lyra; };
  trime-data = callPackage ./trime-data { };
  copy-trime-data-to = callPackage ./copy-trime-data-to { inherit trime-data; };
  calibre = callPackage ./calibre { inherit (pkgs) calibre; };
  hougeo = callPackage ./hougeo { source = sources.hougeo; };
}
