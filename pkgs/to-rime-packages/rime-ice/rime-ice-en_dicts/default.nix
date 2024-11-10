
{
  stdenvNoCC,
  haskellPackages,
  source,
  
}:
stdenvNoCC.mkDerivation {
  inherit (source) src version;
  pname = "rime-ice-en_dicts";
  passthru.rimeDependencies = [  ];
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
    shake en_dicts
  '';
  installPhase = ''
    mkdir -p $out/share/rime-data
    mkdir -p build
    cp -r build/* $out/share/rime-data
  '';
}