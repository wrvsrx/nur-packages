{ wezterm, source }:
wezterm.override (old: {
  rustPlatform = old.rustPlatform // {
    buildRustPackage =
      x:
      old.rustPlatform.buildRustPackage (
        x
        // {
          inherit (source) version src;
          postPatch =
            x.postPatch
            + ''
              cp ${source.src}/Cargo.lock Cargo.lock
              echo ${source.version} > .tag
            '';
          cargoLock = {
            lockFile = "${source.src}/Cargo.lock";
            allowBuiltinFetchGit = true;
            # outputHashes = {
            #   "sqlite-cache-0.1.3" = "sha256-sBAC8MsQZgH+dcWpoxzq9iw5078vwzCijgyQnMOWIkk=";
            #   "xcb-imdkit-0.3.0" = "";
            # };
          };
        }
      );
  };
})
