{
  buildPythonPackage,
  pydantic,
  pcpp,
  pyyaml,
  platformdirs,
  pydantic-settings,
  tree-sitter,
  tree-sitter-devicetree,
  poetry-core,
  pythonRelaxDepsHook,
  lib,
  source,
}:
buildPythonPackage {
  inherit (source) pname src;
  pyproject = true;

  version = lib.removePrefix "v" source.version;

  nativeBuildInputs = [
    poetry-core
    pythonRelaxDepsHook
  ];

  pythonRelaxDeps = [ "tree-sitter" ];

  propagatedBuildInputs = [
    pydantic
    pcpp
    pyyaml
    platformdirs
    pydantic-settings
    tree-sitter
    tree-sitter-devicetree
  ];

}
