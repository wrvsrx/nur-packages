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
  googletrans = prev.callPackage ./googletrans {
    inherit (prev) googletrans;
    source = sources.googletrans;
  };
}
