{ meson
, fetchpatch
}:
meson.overridePythonAttrs (old: {
  patches = old.patches ++ [
    (fetchpatch {
      url = "https://github.com/mesonbuild/meson/compare/6ccd708f30e3649f6d531eebb8301132cb0f0759...12a186fae1b920aa3b2baddc86c0fe779296917b.patch";
      hash = "sha256-yYxVdqBacsZ0oJkiRdC4kD1t2ztodQcey2U1iuXmuxI=";
    })
  ];
})

