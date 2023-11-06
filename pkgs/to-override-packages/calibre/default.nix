{ calibre }:
calibre.overrideAttrs (old: {
  patches = old.patches ++ [ ./smart_device.patch ];
})
