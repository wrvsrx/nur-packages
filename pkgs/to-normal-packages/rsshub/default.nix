{
  mkPnpmPackage,
  stdenvNoCC,
  nodePackages,
  writeText,
  writeShellScriptBin,
  bash,
  fetchpatch,
  applyPatches,
  source,
}:
let
  patched-src = applyPatches {
    name = "patched-rsshub-src";
    inherit (source) src;
    patches = [
      (writeText "git.patch" ''
        diff --git a/lib/utils/git-hash.ts b/lib/utils/git-hash.ts
        index 9a8131696..62afc27ec 100644
        --- a/lib/utils/git-hash.ts
        +++ b/lib/utils/git-hash.ts
        @@ -1,14 +1,14 @@
         import { execSync } from 'child_process';
         
        -let gitHash = process.env.HEROKU_SLUG_COMMIT?.slice(0, 8) || process.env.VERCEL_GIT_COMMIT_SHA?.slice(0, 8);
        -let gitDate: Date | undefined;
        -if (!gitHash) {
        -    try {
        -        gitHash = execSync('git rev-parse HEAD').toString().trim().slice(0, 8);
        -        gitDate = new Date(execSync('git log -1 --format=%cd').toString().trim());
        -    } catch {
        -        gitHash = 'unknown';
        -    }
        -}
        +let gitHash = '${source.version}'.slice(0, 8);
        +let gitDate: Date | undefined = new Date('${source.date}');
        +// if (!gitHash) {
        +//     try {
        +//         gitHash = execSync('git rev-parse HEAD').toString().trim().slice(0, 8);
        +//         gitDate = new Date(execSync('git log -1 --format=%cd').toString().trim());
        +//     } catch {
        +//         gitHash = 'unknown';
        +//     }
        +// }
         
         export { gitHash, gitDate };
      '')
      (fetchpatch {
        url = "https://github.com/wrvsrx/RSSHub/commit/91dd48083edbf8e6370b8e98844d04dad5a3390c.patch";
        hash = "sha256-72OygZh7XNDpFMrgxxRRNS/911NkoCBTH9POz2kWtw4=";
      })
    ];
  };
  node-modules =
    (mkPnpmPackage {
      inherit (source) pname version;
      src = "${patched-src}";
      installEnv.PUPPETEER_SKIP_DOWNLOAD = "1";
      noDevDependencies = true;
    }).passthru.nodeModules;
  rsshub-website = stdenvNoCC.mkDerivation {
    inherit (source) pname version;
    src = patched-src;
    buildInputs = [ nodePackages.pnpm ];
    buildPhase = ''
      ln -s ${node-modules}/node_modules node_modules
      pnpm build
    '';
    installPhase = ''
      mkdir -p $out
      mkdir -p $out/assets
      ln -s ${node-modules}/node_modules $out/node_modules
      cp -r assets/build $out/assets/build
      cp -r lib package.json tsconfig.json $out

      mkdir -p $out/bin
      cat > $out/bin/rsshub <<- EOF
      #!${bash}/bin/bash

      TSX_TSCONFIG_PATH=$out/tsconfig.json ${nodePackages.nodejs}/bin/node $out/node_modules/tsx/dist/cli.mjs $out/lib/index.ts
      EOF
      chmod +x $out/bin/rsshub
    '';
  };
in
rsshub-website
