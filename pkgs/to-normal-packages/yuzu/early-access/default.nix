{
  mainline,
  fetchzip,
  fetchgit,
  runCommand,
  gnutar,
  source,
}:
# The mirror repo for early access builds is missing submodule info,
# but the Windows distributions include a source tarball, which in turn
# includes the full git metadata. So, grab that and rehydrate it.
# This has the unfortunate side effect of requiring two FODs, one
# for the Windows download and one for the full repo with submodules.
let
  sources = import ./sources.nix;

  zip = source.src;

  gitSrc =
    runCommand "yuzu-ea-dist-unpacked"
      {
        src = zip;
        nativeBuildInputs = [ gnutar ];
      }
      ''
        mkdir $out
        tar xf $src/yuzu-windows-msvc-source-20240301-72ac0b9787.tar.xz --directory=$out --strip-components=1
      '';

  rehydratedSrc = fetchgit {
    name = "yuzu-ea-rehydrated";
    url = gitSrc;
    fetchSubmodules = true;
    hash = "";
  };
in
mainline.overrideAttrs (
  old: {
    inherit (source) pname version src;
    passthru.updateScript = ./update.sh;
    meta = old.meta // {
      description = old.meta.description + " - early access branch";
    };
  }
)
