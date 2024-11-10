{
  fetchFromGitHub,
  pnpm,
  stdenvNoCC,
  nodejs,
  writeText,
  bash,
}:
stdenvNoCC.mkDerivation rec {
  pname = "rsshub";
  version = "d2905cf94409e04b92ea90f4e0dd99afb4cb9dd9";
  src = fetchFromGitHub {
    owner = "DIYGod";
    repo = "RSSHub";
    rev = "d2905cf94409e04b92ea90f4e0dd99afb4cb9dd9";
    fetchSubmodules = false;
    sha256 = "sha256-gmOSCJWneN0HQOoSoK3FqI/qXKGpuVtmYOR4p9a7lmU=";
  };
  pnpmDeps = pnpm.fetchDeps {
    inherit pname version src;
    hash = "sha256-VON3Ej9g6bIt2imxyLxpEROXNJSoM99K0+Jf0CAhN+I=";
  };
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
      +let gitHash = '${version}'.slice(0, 8);
      +let gitDate: Date | undefined = new Date('1970-01-01');
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
  ];
  nativeBuildInputs = [
    pnpm.configHook
    nodejs
  ];
  buildPhase = "pnpm build";
  installPhase = ''
    mkdir -p $out
    mkdir -p $out/assets
    mv node_modules $out/node_modules
    cp -r assets/build $out/assets/build
    cp -r lib package.json tsconfig.json $out

    mkdir -p $out/bin
    cat > $out/bin/rsshub <<- EOF
    #!${bash}/bin/bash

    TSX_TSCONFIG_PATH=$out/tsconfig.json ${nodejs}/bin/node $out/node_modules/tsx/dist/cli.mjs $out/lib/index.ts
    EOF
    chmod +x $out/bin/rsshub
  '';
}
