{
  php,
  fetchpatch,
  source,
}:
php.buildComposerProject {
  inherit (source) pname src version;
  vendorHash = "sha256-ffIKhYVhj5PHAVT5XOa6o219f04ZOL9B2dZVC3eunWc=";
  patches = [
    (fetchpatch {
      url = "https://github.com/wrvsrx/Baikal/commit/548dfbabccfcd0f90f184a2168935d34bee7423d.patch";
      hash = "sha256-dgyDUywqNkx6ST2cWX1gwsS7DeGNckbjI2z1iPysGNQ=";
    })
    (fetchpatch {
      url = "https://github.com/wrvsrx/Baikal/commit/20c7c229de4747541bc733a20160fd62a359c3cc.patch";
      hash = "sha256-Z1KXlCa0Iyy43SL75swOiRuCMZvaFuyJaid6VgK3c0I=";
    })
  ];
}
