
{
  stdenvNoCC,
  haskellPackages,
  rimeDataBuildHook,
  librime,
  # we need default.yaml provided by rime-prelude
  rime-prelude,
  source,
  rime-ice-lua, rime-ice-common, rime-ice-opencc, rime-ice-pinyin-dict, rime-ice-melt_eng, rime-ice-radical_pinyin
}:
let
  src_ =
    stdenvNoCC.mkDerivation {
      inherit (source) src version;
      pname = "rime-ice-flypy";
      propagatedBuildInputs = [ rime-prelude rime-ice-lua rime-ice-common rime-ice-opencc rime-ice-pinyin-dict rime-ice-melt_eng rime-ice-radical_pinyin ];
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
    };
in
  stdenvNoCC.mkDerivation {
    inherit (src_)
      pname
      version
      propagatedBuildInputs;
    src = "${src_}/share/rime-data";
    nativeBuildInputs = [
      rimeDataBuildHook
      librime
    ];
    installPhase = ''
      rm -rf rime_data_deps/
      mkdir -p $out/share/rime-data/
      cp -r . $out/share/rime-data/
    '';
  }
