{ systemd, fetchpatch }:
systemd.overrideAttrs (old: {
  patches = (old.patches or [ ]) ++ [
    (fetchpatch {
      url = "https://github.com/wrvsrx/systemd/compare/cbd5f5d7d6d652d52a18170123f5d08baf7e9862...1c000ac64fc8898a0fd238cb7038d3efd8d60a70.patch";
      hash = "sha256-iDC5lenk4LhDdU4ZRHjestYu2jXNvNZCgSCkE2hQHuQ=";
    })
  ];
})
