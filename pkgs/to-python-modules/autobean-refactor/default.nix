{
  buildPythonPackage,
  lark,
  pdm-pep517,
  source,
  typing-extensions,
}:
buildPythonPackage {
  inherit (source) pname version src;

  format = "pyproject";

  propagatedBuildInputs = [
    lark
    pdm-pep517
    typing-extensions
  ];
}
