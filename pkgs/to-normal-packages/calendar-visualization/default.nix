{ mkDerivation
, aeson
, base
, bytestring
, Chart
, Chart-cairo
, containers
, data-default
, deepseq
, directory
, filepath
, iCalendar
, lib
, optparse-applicative
, pretty-simple
, split
, text
, time
, transformers
, unicode-show
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
    Chart
    Chart-cairo
    containers
    data-default
    deepseq
    directory
    filepath
    iCalendar
    optparse-applicative
    pretty-simple
    split
    text
    time
    transformers
    unicode-show
  ];
  license = "unknown";
  mainProgram = "calendar-visualization";
}
