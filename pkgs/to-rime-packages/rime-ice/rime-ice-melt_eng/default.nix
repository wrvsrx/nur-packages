
{
  stdenvNoCC,
  haskellPackages,
  source,
  rime-ice-en_dicts
}:
stdenvNoCC.mkDerivation {
  inherit (source) src version;
  pname = "rime-ice-melt_eng";
  passthru.rimeDependencies = [ rime-ice-en_dicts ];
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
    shake melt_eng
  '';
  installPhase = ''
    mkdir -p $out/share/rime-data
    mkdir -p build
    cp -r build/* $out/share/rime-data
  '';
}
