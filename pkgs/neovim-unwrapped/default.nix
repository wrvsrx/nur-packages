{ neovim-unwrapped, fetchpatch }:
neovim-unwrapped.overrideAttrs (old: {
  patches = (old.patches or [ ]) ++ [
    (fetchpatch {
      # https://github.com/neovim/neovim/pull/30747
      url = "https://github.com/neovim/neovim/compare/f72dc2b4c805f309f23aff62b3e7ba7b71a554d2...80e37aa533573ef1ad96bcccc006b8d45dc963b9.patch";
      hash = "sha256-2oNHUQozXKrHvKxt7R07T9YRIIx8W3gt8cVHLm2gYhg=";
    })
  ];

})
