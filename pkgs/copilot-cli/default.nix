{
  buildNpmPackage,
  source,
}:

buildNpmPackage {
  inherit (source) pname version src;

  postPatch = ''
    cp ${./package-lock.json} package-lock.json
  '';

  npmDepsHash = "sha256-u2lofopWa07/D+0n98Y63OhK0LaWmY5iEMGS6qQ/mEs=";

  dontNpmBuild = true;

  meta = {
    mainProgram = "copilot";
  };
}
