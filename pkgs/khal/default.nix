{ khal }:
khal.overrideAttrs (old: {
  patches = (old.patches or [ ]) ++ [
    ./intersphinx.patch
  ];
})
