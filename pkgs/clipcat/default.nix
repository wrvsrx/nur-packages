{ clipcat, fetchFromGitHub }:
clipcat.overrideAttrs (drv: rec {
  version = "0.5.1";
  src = fetchFromGitHub {
    owner = "Icelk";
    repo = "clipcat";
    rev = "81e05f72f677dfca97cea7a46288e0b15439fa3c";
    sha256 = "54A9Fb4ekgxeQ24OPZglhHr7UWm4JYeM0UbK78eFvM8=";
  };
  cargoDeps = drv.cargoDeps.overrideAttrs (_: {
    inherit src; # You need to pass "src" here again,
    # otherwise the old "src" will be used.
    outputHash = "sha256-s80CGlIXcChyX5CEjIV8W7n//LmOSJA8SdC3CoZN2vg=";
  });
  cargoBuildFeatures = [ ];
  cargoCheckFeatures = [ ];
})
