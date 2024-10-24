{ pkgs, to-sources }:
let
  sources = to-sources { inherit pkgs; };
in
self: super: {
  autobean-format = self.callPackage ./autobean-format { source = sources.autobean-format; };
  autobean-refactor = self.callPackage ./autobean-refactor { source = sources.autobean-refactor; };
  compdb = self.callPackage ./compdb { source = sources.compdb; };
  OpenEXR = self.callPackage ./OpenEXR { source = sources.OpenEXR; };
  googletrans = self.callPackage ./googletrans {
    inherit (super) googletrans;
    source = sources.googletrans;
  };
}
