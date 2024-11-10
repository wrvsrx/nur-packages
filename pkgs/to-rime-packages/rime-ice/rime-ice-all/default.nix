
{
  stdenvNoCC,
  haskellPackages,
  source,
  rime-ice-flypy
}:
stdenvNoCC.mkDerivation {
  inherit (source) src version;
  pname = "rime-ice-all";
  passthru.rimeDependencies = [ rime-ice-flypy ];
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
    shake all
  '';
  installPhase = ''
    mkdir -p $out/share/rime-data
    mkdir -p build
    cp -r build/. $out/share/rime-data/
  '';
}
