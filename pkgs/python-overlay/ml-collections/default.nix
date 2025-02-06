{ ml-collections, six }:
ml-collections.override (old: {
  buildPythonPackage =
    x:
    old.buildPythonPackage (
      x
      // {
        propagatedBuildInputs = (x.propagatedBuildInputs or [ ]) ++ [ six ];
      }
    );
})
