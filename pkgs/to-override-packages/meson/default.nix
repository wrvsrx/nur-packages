{ meson
, fetchpatch
}:
meson.overridePythonAttrs (old: {
  patches = old.patches ++ [
    (fetchpatch {
      url = "https://github.com/mesonbuild/meson/compare/6ccd708f30e3649f6d531eebb8301132cb0f0759...a645f0858866ddaf7d56fa64a0c6588d2ebfca9a.patch";
      hash = "sha256-vbUFbKn6I/6FSOCjidF+tqsLT8haxQEucs2iLFFFlrw=";
    })
  ];
})

