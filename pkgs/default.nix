let
  to-sources = import ./to-sources;
  pkgs-to-python-modules = pkgs: (import ./to-python-modules) { inherit pkgs to-sources; };
  pkgs-to-haskell-overlay = pkgs: (import ./to-haskell-overlay) { inherit pkgs to-sources; };
  pkgs-to-normal-packages = pkgs: (import ./to-normal-packages) { inherit pkgs to-sources; };
  pkgs-to-override-packages = pkgs: (import ./to-override-packages) { inherit pkgs to-sources; };
  pkgs-to-toplevel =
    pkgs:
    let
      normal-packages = pkgs-to-normal-packages pkgs;
      override-packages = pkgs-to-override-packages pkgs;
    in
    normal-packages // override-packages;
  pkgs-to-packages =
    pkgs:
    let
      flat-packages = pkgs-to-toplevel pkgs;
      python3Packages = pkgs-to-python-modules pkgs { } pkgs.python3.pkgs;
      haskellPackages = pkgs-to-haskell-overlay pkgs { } pkgs.haskellPackages;
      vimPlugins = pkgs-to-vim-plugins pkgs;
    in
    flat-packages
    // {
      haskellPackages = pkgs.lib.recurseIntoAttrs haskellPackages;
      python3Packages = pkgs.lib.recurseIntoAttrs python3Packages;
      vimPlugins = pkgs.lib.recurseIntoAttrs vimPlugins;
    };
  pkgs-to-vim-plugins = pkgs: (import ./to-vim-plugins) { inherit pkgs to-sources; };
in
{
  inherit
    pkgs-to-packages
    pkgs-to-python-modules
    pkgs-to-vim-plugins
    pkgs-to-haskell-overlay
    pkgs-to-toplevel
    ;
}
