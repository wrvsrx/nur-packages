{ fcitx5-rime, fetchpatch }:
fcitx5-rime.overrideAttrs {
  patches = [
    (fetchpatch {
      # https://github.com/wrvsrx/fcitx5-rime/tree/tag_support-set-data-dir-via-xdg-2
      url = "https://github.com/wrvsrx/fcitx5-rime/compare/fd8bf83dcd731eacd095f8b01cd2ea1f9e9aa429...80955b33e33cb85de9e33052d8e42f8d6822613b.patch";
      hash = "sha256-Pgz/+3XkAxbwpIS3cnmfaAz9eHcrNFqSq8n8EkSiz1Q=";
    })

  ];

}
