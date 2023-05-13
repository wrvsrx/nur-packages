let
  to-normal-packages = import ./to-normal-packages;
  to-sources = import ./to-sources;
  to-python-modules = import ./to-python-modules;
  pkgs-to-python-modules = pkgs: to-python-modules { inherit pkgs to-sources; };
  pkgs-to-packages = pkgs:
    let
      normal-packages = to-normal-packages { inherit pkgs to-sources; };
      pythonWithPackages = pkgs.python3.override {
        self = pythonWithPackages;
        packageOverrides = to-python-modules { inherit to-sources pkgs; };
      };
      python-packages = {
        vdirsyncer = with pythonWithPackages.pkgs; toPythonApplication vdirsyncer;
      };
    in
    normal-packages // python-packages;
in
{
  inherit pkgs-to-packages pkgs-to-python-modules;
}
