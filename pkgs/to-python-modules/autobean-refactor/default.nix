{ buildPythonPackage, lark, pdm-pep517, source }:
buildPythonPackage {
  inherit (source) pname version src;

  format = "pyproject";


  propagatedBuildInputs = [
    lark
    pdm-pep517
  ];
}
