let
  to-normal-packages = import ./to-normal-packages;
  to-override-packages = import ./to-override-packages;
  to-sources = import ./to-sources;
  to-python-modules = import ./to-python-modules;
  to-vim-plugins = import ./to-vim-plugins;
  pkgs-to-python-modules = pkgs: to-python-modules { inherit pkgs to-sources; };
  pkgs-to-normal-packages = pkgs: to-normal-packages { inherit pkgs to-sources; };
  pkgs-to-override-packages = pkgs: to-override-packages { inherit pkgs to-sources; };
  pkgs-to-packages = pkgs:
    let
      normal-packages = pkgs-to-normal-packages pkgs;
      override-packages = pkgs-to-override-packages pkgs;
      pythonWithPackages = pkgs.python311.override {
        self = pythonWithPackages;
        packageOverrides = to-python-modules { inherit to-sources pkgs; };
      };
      python-packages =
        let
          inherit (pythonWithPackages.pkgs)
            toPythonApplication
            vdirsyncer
            compdb
            ;
        in
        {
          vdirsyncer = toPythonApplication vdirsyncer;
          compdb = toPythonApplication compdb;
          inherit (pythonWithPackages.pkgs)
            autobean-format
            autobean-refactor
            OpenEXR
            googletrans
            jaxtyping
            ;
        };
      vim-plugins = pkgs-to-vim-plugins pkgs;
    in
    normal-packages // override-packages // python-packages // vim-plugins;
  pkgs-to-vim-plugins = pkgs: to-vim-plugins { inherit pkgs to-sources; };
in
{
  inherit
    pkgs-to-normal-packages
    pkgs-to-packages
    pkgs-to-python-modules
    pkgs-to-vim-plugins
    ;
}
