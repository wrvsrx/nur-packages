# shellcheck shell=bash

function lakeConfigureHook {
  echo "Executing leanConfigureHook"
  lean --run @@lake-configure@@
  echo "Finished executing leanConfigureHook"
}

function lakeBuildHook {
  echo "Executing lakeBuildHook"
  runHook preBuild

  lake build

  runHook postBuild
  echo "Finished executing lakeBuildHook"
}

if [ -z "${dontLakeConfigure-}" ]; then
  configureHooks+=(lakeConfigureHook)
fi
if [ -z "${dontLakeBuild-}" ] && [ -z "${buildPhase-}" ]; then
  buildPhase=lakeBuildHook
fi
