{
  calibre,
  fetchurl,
  fetchpatch,
}:
calibre.overrideAttrs (rec {
  version = "7.21.0";
  src = fetchurl {
    url = "https://download.calibre-ebook.com/${version}/calibre-${version}.tar.xz";
    hash = "sha256-61Nbclkt59sh8VHh3uRw0GvlDjlyOz1jrsFMMIuzPLE=";
  };
  patches = [
    #  allow for plugin update check, but no calibre version check
    (fetchpatch {
      name = "0001-only-plugin-update.patch";
      url = "https://raw.githubusercontent.com/debian-calibre/calibre/debian/${version}+ds-1/debian/patches/0001-only-plugin-update.patch";
      hash = "sha256-mHZkUoVcoVi9XBOSvM5jyvpOTCcM91g9+Pa/lY6L5p8=";
    })
    (fetchpatch {
      name = "0007-Hardening-Qt-code.patch";
      url = "https://raw.githubusercontent.com/debian-calibre/calibre/debian/${version}+ds-1/debian/patches/hardening/0007-Hardening-Qt-code.patch";
      hash = "sha256-9hi4T9LB7aklWASMR8hIuKBgZm2arDvORfmk9S8wgCA=";
    })
  ];
})
