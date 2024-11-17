{ librime, fetchpatch }:
librime.overrideAttrs {
  patches = [
    (fetchpatch {
      url = "https://github.com/wrvsrx/librime/compare/c7ab6390c143a11d670f3add41218111edb883c9...fe9eb9a94d753e9e6837b0e982ce9cc80028dfc9.patch";
      hash = "sha256-1dnHYUZf626C/ByXVtsgWpFql2VEwQQXXS+I3FkLqHA=";
    })
  ];
}
