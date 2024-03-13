{
  buildPythonPackage,
  autobean-refactor,
  pdm-pep517,
  source,
}:
buildPythonPackage {
  inherit (source) pname version src;
  format = "pyproject";

  propagatedBuildInputs = [
    pdm-pep517
    autobean-refactor
  ];
}
