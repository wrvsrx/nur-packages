{ meson, fetchpatch }:
meson.overrideAttrs (old: {
  patches = (old.patches or [ ]) ++ [
    # https://github.com/mesonbuild/meson/pull/14178
    (fetchpatch {
      url = "https://github.com/wrvsrx/meson/compare/tag_fix-mformat-5%5E...tag_fix-mformat-5.patch";
      hash = "sha256-fmKuMutTF5aWs1/53dtlTsDO+glXuokzk1ziePFtYmU=";
    })
  ];
})
