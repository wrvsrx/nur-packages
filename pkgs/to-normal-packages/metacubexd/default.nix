{
  nodePackages,
  nodejs,
  pnpm,
  vips,
  pkg-config,
  python3,
  zlib,
  stdenvNoCC,
  fetchFromGitHub,
}:
stdenvNoCC.mkDerivation rec {
  pname = "metacubexd";
  version = "1.140.0";
  src = fetchFromGitHub {
    owner = "MetaCubeX";
    repo = "metacubexd";
    rev = "v1.140.0";
    fetchSubmodules = false;
    sha256 = "sha256-OVLG+MHgwWTorPuBTHsHUAY1FSN91j7xWgRDJ7FiO7E=";
  };
  pnpmDeps = pnpm.fetchDeps {
    inherit pname version src;
    hash = "sha256-24PkWT5UZJwMtL3y8qdf3XFuf3v5PjiP9XESbw3oppY=";
    env = {
      # otherwise, node-gyp will try to download node headers from internet
      # It see
      npm_config_nodedir = "${nodejs}";
    };
  };
  nativeBuildInputs = [
    pnpm.configHook
    nodePackages.node-gyp
    nodejs
    pkg-config
    python3
    vips
    zlib
  ];
  buildPhase = "pnpm build";
  installPhase = ''
    mkdir -p $out
    cp -r dist/* $out
  '';
}
