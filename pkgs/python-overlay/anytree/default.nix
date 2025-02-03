{ anytree }:
anytree.overrideAttrs (old: {
  patches = (old.patches or [ ]) ++ [
    ./python-anytree-poetry-project-name-version.patch
  ];
})
