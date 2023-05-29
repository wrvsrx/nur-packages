{ lib, buildPythonPackage, source }:

buildPythonPackage {
  inherit (source) pname version src;

  doCheck = false;

  meta = {
    homepage = "https://github.com/Sarcasm/compdb";
    description = "The compilation database Swiss army knife";
    license = lib.licenses.mit;
  };
}
