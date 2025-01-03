{
  stdenvNoCC,
  fcitx5-rime,
  zstd,
}:
stdenvNoCC.mkDerivation {
  pname = "rime-fcitx5";
  # for unzip source files
  nativeBuildInputs = [ zstd ];
  inherit (fcitx5-rime) src version;
  installPhase = ''
    mkdir -p $out/share/rime-data
    cp -r data/fcitx5.yaml $out/share/rime-data/
  '';
}
