{ mkDerivation
, aeson
, base
, bytestring
, containers
, fgl
, graphviz
, lib
, optparse-applicative
, taskwarrior
, text
, time
, uuid
, source
}:
mkDerivation {
  inherit (source) pname version src;
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [
    aeson
    base
    bytestring
    containers
    fgl
    graphviz
    optparse-applicative
    taskwarrior
    text
    time
    uuid
  ];
  homepage = "https://github.com/wrvsrx/taskwarrior-to-dot";
  license = lib.licenses.mit;
  mainProgram = "taskwarrior-utils";
}
