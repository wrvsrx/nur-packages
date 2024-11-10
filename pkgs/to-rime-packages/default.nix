{ to-sources, pkgs }:
let
  inherit (pkgs) librime lib newScope;
  sources = to-sources { inherit pkgs; };
in

lib.makeScope newScope (
  self:
  let
    inherit (self) callPackage;
    hooks = callPackage ./hooks { };
  in
  {
    inherit librime;
    withRimeDeps = callPackage ./with-rime-deps { };
    withRimeDeps' = callPackage ./with-rime-deps-prime { };
    inherit (hooks) rimeDataBuildHook;
    rime-fcitx5 = callPackage ./rime-fcitx5 { };
    rime-prelude = callPackage ./rime-prelude { source = sources.rime-prelude; };
    rr = callPackage (
      {
        rime-fcitx5,
        rime-prelude,
        rime-ice-flypy,
        withRimeDeps',
      }:
      withRimeDeps' [
        rime-fcitx5
        rime-prelude
        rime-ice-flypy
      ]
    ) { };
  }
  // (import ./rime-ice { source = sources.rime-ice; } self)
)
