{
  qt6ct,
  qtdeclarative,
  kconfig,
  kcolorscheme,
  kiconthemes,
}:

qt6ct.overrideAttrs (oldAttrs: {
  buildInputs = oldAttrs.buildInputs ++ ([
    qtdeclarative
    kconfig
    kcolorscheme
    kiconthemes
  ]);

  patches = [
    ./qt6ct-shenanigans.patch
  ];
})
