{ sources }:
self: super: {
  autobean-format = self.callPackage ./autobean-format { source = sources.autobean-format; };
  autobean-refactor = self.callPackage ./autobean-refactor { source = sources.autobean-refactor; };
}
