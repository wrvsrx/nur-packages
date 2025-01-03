{
  stdenvNoCC,
  fcitx5-rime,
}:
stdenvNoCC.mkDerivation {
  pname = "rime-fcitx5";
  inherit (fcitx5-rime) src version;
  installPhase = ''
    mkdir -p $out/share/rime-data
    cp -r data/fcitx5.yaml $out/share/rime-data/
  '';
}
