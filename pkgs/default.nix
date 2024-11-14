{ inputs }:
let
  to-sources = import ./to-sources;
  pkgs-to-other-nur = pkgs: import ./to-other-nur { inherit inputs; } { inherit pkgs; };
  pkgs-to-python-modules = pkgs: (import ./to-python-modules) { inherit pkgs to-sources; };
  pkgs-to-haskell-overlay = pkgs: (import ./to-haskell-overlay) { inherit pkgs to-sources; };
  pkgs-to-normal-packages = pkgs: (import ./to-normal-packages) { inherit pkgs to-sources; };
  pkgs-to-override-packages = pkgs: (import ./to-override-packages) { inherit pkgs to-sources; };
  pkgs-to-rime-packages = pkgs: (import ./to-rime-packages) { inherit pkgs to-sources; };
  pkgs-to-toplevel =
    pkgs:
    let
      normal-packages = pkgs-to-normal-packages pkgs;
      override-packages = pkgs-to-override-packages pkgs;
      other-nur = pkgs-to-other-nur pkgs;
    in
    normal-packages
    // override-packages
    // other-nur
    // {
      rimePackages = pkgs.lib.recurseIntoAttrs (pkgs-to-rime-packages pkgs);
    };
  pkgs-to-packages =
    pkgs:
    let
      flat-packages = pkgs-to-toplevel pkgs;
      python3Packages =
        let
          p = pkgs-to-python-modules pkgs pkgs.python3.pkgs pkgs.python3.pkgs;
        in
        p;
      haskellPackages = pkgs-to-haskell-overlay pkgs { } pkgs.haskellPackages;
      vimPlugins = pkgs-to-vim-plugins-overlay pkgs { } pkgs.vimPlugins;
    in
    flat-packages
    // {
      haskellPackages = pkgs.lib.recurseIntoAttrs haskellPackages;
      python3Packages = pkgs.lib.recurseIntoAttrs python3Packages;
      vimPlugins = pkgs.lib.recurseIntoAttrs vimPlugins;
    };
  pkgs-to-vim-plugins-overlay = pkgs: (import ./to-vim-plugins) { inherit pkgs to-sources; };
  overlay =
    final: prev:
    pkgs-to-toplevel prev
    // {
      pythonPackagesExtensions = prev.pythonPackagesExtensions ++ [ (pkgs-to-python-modules prev) ];
      haskellPackages = prev.haskellPackages.extend (pkgs-to-haskell-overlay prev);
      vimPlugins = prev.vimPlugins.extend (pkgs-to-vim-plugins-overlay prev);
    };
in
{
  inherit
    pkgs-to-packages
    overlay
    ;
}
