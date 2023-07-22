{ buildPythonPackage
, hatchling
, numpy
, typeguard
, typing-extensions
, source
}:
buildPythonPackage {
  inherit (source) pname version src;
  format = "pyproject";

  propagatedBuildInputs = [
    hatchling
    numpy
    typeguard
    typing-extensions
  ];
}
