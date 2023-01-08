{ xclip, fetchFromGitHub }:
xclip.overrideAttrs (old: {
  version = "0.14";
  src = fetchFromGitHub {
    owner = "astrand";
    repo = "xclip";
    rev = "b372f73579d30f9ba998ffd0a73694e7abe2c313";
    sha256 = "pBGRV2h7JiNZ4Im3NySEq1UGNW65MpvTjpTxy0m8jc4=";
  };
})
