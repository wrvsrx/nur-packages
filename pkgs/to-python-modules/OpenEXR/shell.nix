{
  mkShell,
  python3,
  openexr,
}:
let
  pythonOverride = final: prev: { };
  python = python3.override { packageOverrides = pythonOverride; };
in
mkShell {
  buildInputs = [
    (python.withPackages (
      ps: with ps; [
        tensorflowWithCuda
        pip
        (buildPythonPackage rec {
          pname = "tensorflow-graphics-gpu";
          version = "1.0.0";
          src = fetchPypi {
            inherit pname version;
            sha256 = "sha256-BTPBDfzPBBO1vslTsmDHsh/BvF3tn3lepNM2BH0vL4Y=";
          };
          doCheck = false;
          propagatedBuildInputs = [
            # Specify dependencies
            numpy
            tensorflow
            (buildPythonPackage rec {
              pname = "tensorflow-addons";
              version = "0.20.0";
              src = fetchPypi {
                inherit pname version;
                sha256 = "sha256-Yj9rbJJn2pag36vs4/uCiuqEBeIAS5sKYogkJnRwY1U=";
              };
              doCheck = false;
              propagatedBuildInputs = [
                typeguard
                packaging
              ];
            })
            OpenEXR
            tensorflow-datasets
            absl-py
            h5py
            matplotlib
            numpy
            psutil
            scipy
            tqdm
            termcolor
            trimesh
            # Required by trimesh.
            networkx
          ];
        })
      ]
    ))
  ];
}
