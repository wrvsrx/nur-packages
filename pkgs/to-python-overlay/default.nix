{ pkgs, to-sources }:
let
  sources = to-sources { inherit pkgs; };
in
final: prev: rec {
  autobean-format = prev.callPackage ./autobean-format {
    source = sources.autobean-format;
    inherit autobean-refactor;
  };
  autobean-refactor = prev.callPackage ./autobean-refactor { source = sources.autobean-refactor; };
  compdb = prev.callPackage ./compdb { source = sources.compdb; };
  OpenEXR = prev.callPackage ./OpenEXR { source = sources.OpenEXR; };
  jraph = prev.callPackage ./jraph { source = sources.jraph; };
  jax-md = prev.callPackage ./jax-md {
    source = sources.jax-md;
    inherit e3nn-jax jraph;
  };
  e3nn-jax = prev.callPackage ./e3nn-jax {
    source = sources.e3nn-jax;
  };
  googletrans = prev.callPackage ./googletrans {
    inherit (prev) googletrans;
    source = sources.googletrans;
  };
}
