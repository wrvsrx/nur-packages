
{
  stdenvNoCC,
  haskellPackages,
  source,
  rime-ice-lua, rime-ice-common, rime-ice-opencc, rime-ice-pinyin-dict, rime-ice-melt_eng, rime-ice-radical_pinyin
}:
stdenvNoCC.mkDerivation {
  inherit (source) src version;
  pname = "rime-ice-flypy";
  passthru.rimeDependencies = [ rime-ice-lua rime-ice-common rime-ice-opencc rime-ice-pinyin-dict rime-ice-melt_eng rime-ice-radical_pinyin ];
  nativeBuildInputs = [
    (haskellPackages.ghcWithPackages (
      ps: with ps; [
        shake
        yaml
        utf8-string
        raw-strings-qq
      ]
    ))
  ];
  env.LC_CTYPE = "C.UTF-8";
  postPatch = ''
    cp ${../Shakefile.hs} Shakefile.hs
  '';
  buildPhase = ''
    shake flypy
  '';
  installPhase = ''
    mkdir -p $out/share/rime-data
    mkdir -p build
    cp -r build/. $out/share/rime-data/
  '';
}
