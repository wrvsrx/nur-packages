{
  rime-data,
  fetchFromGitHub,
  stdenvNoCC,
}:
stdenvNoCC.mkDerivation rec {
  pname = "trime-data";
  version = "3.2.14";
  src = fetchFromGitHub {
    owner = "osfans";
    repo = "trime";
    rev = "v${version}";
    sha256 = "sha256-3FNntc1He6/lME4Nf04CIaCkJrCeDcvxIuwaj5lkbo0=";
    sparseCheckout = [ "app/src/main/assets/rime" ];
  };
  buildPhase = "true";
  installPhase = ''
    mkdir -p $out/share/trime-data
    cp -r app/src/main/assets/rime/* $out/share/trime-data
    cp -r ${rime-data}/share/rime-data/* $out/share/trime-data
  '';
}
