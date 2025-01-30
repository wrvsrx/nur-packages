{ meson, fetchpatch }:
meson.overrideAttrs (old: {
  patches = (old.patches or [ ]) ++ [
    # https://github.com/mesonbuild/meson/pull/14178
    (fetchpatch {
      url = "https://github.com/wrvsrx/meson/compare/tag_fix-mformat-4%5E...tag_fix-mformat-4.patch";
      hash = "sha256-+a9lBDiB6aW9ngbSXmEO28Zp/v0fJWZauRtNoiKjoUM=";
    })
  ];
})
