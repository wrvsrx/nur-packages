{ to-sources, pkgs }:
let
  inherit (pkgs) librime lib newScope;
  sources = to-sources { inherit pkgs; };
in

lib.makeScope newScope (
  self:
  let
    inherit (self) callPackage;
  in
  {
    inherit librime;
    withRimeDeps = callPackage ./with-rime-deps { };
    withRimeDeps' = callPackage ./with-rime-deps-prime { };
    rime-fcitx5 = callPackage ./rime-fcitx5 { };
    rime-prelude = callPackage ./rime-prelude { source = sources.rime-prelude; };
  }
  // (import ./rime-ice { source = sources.rime-ice; } self)
)
