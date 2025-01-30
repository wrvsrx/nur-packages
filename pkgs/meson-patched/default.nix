{ meson, fetchpatch }:
meson.overrideAttrs (old: {
  patches = (old.patches or [ ]) ++ [
    # https://github.com/mesonbuild/meson/pull/14178
    (fetchpatch {
      url = "https://github.com/wrvsrx/meson/compare/tag_fix-mformat-6%5E...tag_fix-mformat-6.patch";
      hash = "sha256-BQKx36Kz6HhMDoOxazDRz7KAnRhanMhehGlMwnW7PdU=";
    })
  ];
})
