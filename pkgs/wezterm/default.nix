{ wezterm, fetchFromGitHub }:
wezterm.overrideAttrs (drv: rec {
  version = "nightly";
  src = fetchFromGitHub {
    owner = "wez";
    repo = "wezterm";
    rev = "9350795f33b0544c0f0125379e455557bd8ed9d5";
    fetchSubmodules = true;
    sha256 = "sha256-GbXRB7Tii7eQRzRyuGN23uf/wvjToAO/LnCOMVuRVQc=";
  };
  cargoDeps = drv.cargoDeps.overrideAttrs (_: {
    inherit src; # You need to pass "src" here again,
    # otherwise the old "src" will be used.
    outputHash = "sha256-eGxb7OlufMC9fmbv74M05sEvcVbvfMXfeTGC++hQrN4=";
  });
})
