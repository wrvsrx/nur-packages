{ meson, fetchpatch }:
meson.overrideAttrs (old: {
  patches = (old.patches or [ ]) ++ [
    # https://github.com/mesonbuild/meson/pull/14178
    (fetchpatch {
      url = "https://github.com/wrvsrx/meson/compare/tag_fix-mformat-2%5E...tag_fix-mformat-2.patch";
      hash = "sha256-NbtH9qyvaxPmWo4xs89/ugeSyQQviqsGhkUNJvXqSpI=";
    })
  ];
})
