# shellcheck shell=bash

function lakeConfigureHook {
  echo "Executing leanConfigureHook"
  lean --run @lakeConfigure@ > lake-manifest-overrided.json
  echo "Finished executing leanConfigureHook"
}

function lakeBuildHook {
  echo "Executing lakeBuildHook"
  runHook preBuild

  lake build --packages=lake-manifest-overrided.json

  runHook postBuild
  echo "Finished executing lakeBuildHook"
}

function lakeInstallHook {
  echo "Executing lakeInstallHook"
  runHook preInstall

  mkdir -p $out/src
  mv .* * $out/src
  ln -s $out/src/.lake/build/* $out/

  runHook postInstall
  echo "Finished executing lakeInstallHook"
}

if [[ -z "${dontLakeConfigure-}" && -z "${configurePhase-}" ]]; then
  configurePhase=lakeConfigureHook
fi
if [ -z "${dontLakeBuild-}" ] && [ -z "${buildPhase-}" ]; then
  buildPhase=lakeBuildHook
fi
if [ -z "${dontLakeInstall-}" ] && [ -z "${installPhase-}" ]; then
  installPhase=lakeInstallHook
fi
