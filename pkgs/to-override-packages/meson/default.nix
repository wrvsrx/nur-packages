{ meson
, fetchpatch
}:
meson.overridePythonAttrs (old: {
  patches = old.patches ++ [
    (fetchpatch {
      url = "https://github.com/mesonbuild/meson/compare/6ccd708f30e3649f6d531eebb8301132cb0f0759...a5678b64be9e9e75ded0a7783f70a9c7e47274d0.patch";
      hash = "sha256-qc8Nlqzb5jBL5iGBnJ6DG0m9RIUxG11VR2Ss2NXOa9s=";
    })
  ];
})

