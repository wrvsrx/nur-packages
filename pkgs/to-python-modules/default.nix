{ pkgs, to-sources }:
let
  sources = to-sources { inherit pkgs; };
in
self: super: {
  autobean-format = self.callPackage ./autobean-format { source = sources.autobean-format; };
  autobean-refactor = self.callPackage ./autobean-refactor { source = sources.autobean-refactor; };
  vdirsyncer = self.callPackage ./vdirsyncer { inherit (super) vdirsyncer; source = sources.vdirsyncer; };
}
