{ clipcat, fetchFromGitHub }:
clipcat.overrideAttrs (drv: rec {
  src = fetchFromGitHub {
    owner = "wrvsrx";
    repo = "clipcat";
    rev = "a7ab152da731ad7922825b41a3b0f7b1615e8e29";
    sha256 = "qPllm/F1LUtXgWwuZEc57LfNwBayytUYB/5LE1AcP1o=";
  };
  cargoDeps = drv.cargoDeps.overrideAttrs (_: {
    inherit src; # You need to pass "src" here again,
    # otherwise the old "src" will be used.
    outputHash = "sha256-s80CGlIXcChyX5CEjIV8W7n//LmOSJA8SdC3CoZN2vg=";
  });
  cargoBuildFeatures = [ ];
  cargoCheckFeatures = [ ];
})
