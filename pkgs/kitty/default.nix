{ kitty, fetchFromGitHub }:
kitty.overridePythonAttrs (_: rec {
  version = "0.26.5";
  src = fetchFromGitHub {
    owner = "kovidgoyal";
    repo = "kitty";
    rev = "refs/tags/v${version}";
    sha256 = "sha256-UloBlV26HnkvbzP/NynlPI77z09MBEVgtrg5SeTmwB4=";
  };
})
