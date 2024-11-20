{ pkgs, to-sources }:
let
  sources = to-sources { inherit pkgs; };
in
final: prev: rec {
  autobean-format = final.callPackage ./autobean-format {
    source = sources.autobean-format;
    inherit autobean-refactor;
  };
  autobean-refactor = final.callPackage ./autobean-refactor { source = sources.autobean-refactor; };
  compdb = final.callPackage ./compdb { source = sources.compdb; };
  OpenEXR = final.callPackage ./OpenEXR { source = sources.OpenEXR; };
  jraph = final.callPackage ./jraph { source = sources.jraph; };
  googletrans = final.callPackage ./googletrans {
    inherit (prev) googletrans;
    source = sources.googletrans;
  };
}
