{ sources }:
final: prev: rec {
  # we can only use `final.callPackage` here if we want the overlay works well
  autobean-format = final.callPackage ./autobean-format {
    source = sources.autobean-format;
    inherit autobean-refactor;
  };
  autobean-refactor = final.callPackage ./autobean-refactor { source = sources.autobean-refactor; };
  compdb = final.callPackage ./compdb { source = sources.compdb; };
  OpenEXR = final.callPackage ./OpenEXR { source = sources.OpenEXR; };
  jraph = final.callPackage ./jraph { source = sources.jraph; };
  jax-md = final.callPackage ./jax-md {
    source = sources.jax-md;
    inherit e3nn-jax jraph;
  };
  e3nn-jax = final.callPackage ./e3nn-jax {
    source = sources.e3nn-jax;
  };
  googletrans = final.callPackage ./googletrans {
    inherit (prev) googletrans;
    source = sources.googletrans;
  };
  ml-collections = final.callPackage ./ml-collections {
    inherit (prev) ml-collections;
  };
  keymap-drawer = final.callPackage ./keymap-drawer {
    source = sources.keymap-drawer;
    inherit tree-sitter-devicetree;
  };
  tree-sitter-devicetree = final.callPackage ./tree-sitter-devicetree {
    source = sources.tree-sitter-devicetree;
  };
}