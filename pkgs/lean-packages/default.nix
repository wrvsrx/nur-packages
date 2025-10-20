{
  sources,
  lib,
  newScope,
}:

lib.makeScope newScope (
  self:
  let
    inherit (self) callPackage;
    hooks = callPackage ./hooks { };
  in
  {
    inherit (hooks) lakeSetupHook;
    withRimeDeps' = callPackage ./with-rime-deps-prime { };
    rime-fcitx5 = callPackage ./rime-fcitx5 { };
    rime-prelude = callPackage ./rime-prelude { source = sources.rime-prelude; };
  }
)
