let
  to-normal-packages = import ./to-normal-packages;
  to-override-packages = import ./to-override-packages;
  to-sources = import ./to-sources;
  to-python-modules = import ./to-python-modules;
  to-haskell-overlay = import ./to-haskell-overlay;
  to-vim-plugins = import ./to-vim-plugins;
  pkgs-to-python-modules = pkgs: to-python-modules { inherit pkgs to-sources; };
  pkgs-to-haskell-overlay = pkgs: to-haskell-overlay { inherit pkgs to-sources; };
  pkgs-to-normal-packages = pkgs: to-normal-packages { inherit pkgs to-sources; };
  pkgs-to-override-packages = pkgs: to-override-packages { inherit pkgs to-sources; };
  pkgs-to-flat-packages =
    pkgs:
    let
      normal-packages = pkgs-to-normal-packages pkgs;
      override-packages = pkgs-to-override-packages pkgs;
    in
    normal-packages // override-packages;
  pkgs-to-packages =
    pkgs:
    let
      flat-packages = pkgs-to-flat-packages pkgs;
      pythonWithPackages = pkgs.python311.override {
        self = pythonWithPackages;
        packageOverrides = to-python-modules { inherit to-sources pkgs; };
      };
      python-packages =
        let
          inherit (pythonWithPackages.pkgs) toPythonApplication compdb;
        in
        {
          compdb = toPythonApplication compdb;
          inherit (pythonWithPackages.pkgs)
            autobean-format
            autobean-refactor
            OpenEXR
            googletrans
            ;
        };
      haskell-packages = pkgs-to-haskell-overlay pkgs { } pkgs.haskellPackages;
      vim-plugins = pkgs-to-vim-plugins pkgs;
    in
    flat-packages // python-packages // vim-plugins // haskell-packages;
  pkgs-to-vim-plugins = pkgs: to-vim-plugins { inherit pkgs to-sources; };
in
{
  inherit
    pkgs-to-packages
    pkgs-to-flat-packages
    pkgs-to-python-modules
    pkgs-to-vim-plugins
    pkgs-to-haskell-overlay
    ;
}
