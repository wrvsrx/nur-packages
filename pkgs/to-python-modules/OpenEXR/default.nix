{ buildPythonPackage
, openexr
, typeguard
, packaging
, fetchPypi
}:

buildPythonPackage rec {
  pname = "OpenEXR";
  version = "1.3.9";
  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256-z/zROQYpHvGoGzacHA6Qdkjs0kNjZohzaR9EhmcEqyE=";
  };
  doCheck = false;
  patches = [ ./openexr.patch ];
  buildInputs = [ openexr ];
  propagatedBuildInputs = [
    typeguard
    packaging
  ];
}
