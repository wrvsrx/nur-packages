# This file was generated by nvfetcher, please do not modify it manually.
{ fetchgit, fetchurl, fetchFromGitHub, dockerTools }:
{
  autobean-format = {
    pname = "autobean-format";
    version = "b1222f3ca1bfc771baca276876c3c6df99911bc4";
    src = fetchFromGitHub {
      owner = "SEIAROTg";
      repo = "autobean-format";
      rev = "b1222f3ca1bfc771baca276876c3c6df99911bc4";
      fetchSubmodules = false;
      sha256 = "sha256-3UzZTyaTc4QXH3VnUNEUU+X/1kswTm4QDsO1KMU1B/E=";
    };
    date = "2023-04-11";
  };
  autobean-refactor = {
    pname = "autobean-refactor";
    version = "e169518327eb008f881615b2442ebe27a32dd90e";
    src = fetchFromGitHub {
      owner = "SEIAROTg";
      repo = "autobean-refactor";
      rev = "e169518327eb008f881615b2442ebe27a32dd90e";
      fetchSubmodules = false;
      sha256 = "sha256-eObrTU9LGlEKfQQ81Iq7sfwjilQbkVdVDPh5hbeZb4Q=";
    };
    date = "2023-04-01";
  };
  autodiff = {
    pname = "autodiff";
    version = "v1.0.2";
    src = fetchFromGitHub {
      owner = "autodiff";
      repo = "autodiff";
      rev = "v1.0.2";
      fetchSubmodules = false;
      sha256 = "sha256-2ED7UiyOJw4OdGvihJ25lce127+lGjWyC7MaBKCyNmg=";
    };
  };
  clipcat = {
    pname = "clipcat";
    version = "13b7c4e4065721c4ea6839a8b9d33d0324a65b1b";
    src = fetchFromGitHub {
      owner = "wrvsrx";
      repo = "clipcat";
      rev = "13b7c4e4065721c4ea6839a8b9d33d0324a65b1b";
      fetchSubmodules = false;
      sha256 = "sha256-55FQPX0/6A5Dm6yZ8FqxN4PM6EOPnG3FYti7B/k4XlE=";
    };
    cargoLock."Cargo.lock" = {
      lockFile = ./clipcat-13b7c4e4065721c4ea6839a8b9d33d0324a65b1b/Cargo.lock;
      outputHashes = {
        "x11-clipboard-0.7.0" = "sha256-ToDy7vWPRYk8mrmL+77HJypE91b6z/NaDTUDgRe20d0=";
      };
    };
    date = "2023-01-14";
  };
  coc-zk = {
    pname = "coc-zk";
    version = "7bba1b4f9641d91ab54b5b5d46c3465bce59cc0b";
    src = fetchFromGitHub {
      owner = "wrvsrx";
      repo = "coc-zk";
      rev = "7bba1b4f9641d91ab54b5b5d46c3465bce59cc0b";
      fetchSubmodules = false;
      sha256 = "sha256-GJAvmgesThmb3FJb8Wk5dBZF+grtG8cGNQEYbMOjyc4=";
    };
    date = "2023-05-14";
  };
  compdb = {
    pname = "compdb";
    version = "0.2.0";
    src = fetchurl {
      url = "https://pypi.org/packages/source/c/compdb/compdb-0.2.0.tar.gz";
      sha256 = "sha256-c0cbrdAeXmnIFvs6Tg0BTwmcKCbuKD31cWzXsZAred0=";
    };
  };
  giraffe-wallpaper = {
    pname = "giraffe-wallpaper";
    version = "6fc686fe7b43cb6be8eaf3a9dc42177eb355eadd";
    src = fetchFromGitHub {
      owner = "wrvsrx";
      repo = "giraffe-wallpaper";
      rev = "6fc686fe7b43cb6be8eaf3a9dc42177eb355eadd";
      fetchSubmodules = false;
      sha256 = "sha256-vbpK1+ipg3KzBaX9g8zZiYU8abvKBMkOZKmP8r89wFg=";
    };
    date = "2023-05-20";
  };
  noto-fonts-emoji-monochrome = {
    pname = "noto-fonts-emoji-monochrome";
    version = "d5f498241b3b77beddce3a53ee802c34b1fa46c4";
    src = fetchFromGitHub {
      owner = "wrvsrx";
      repo = "noto-emoji";
      rev = "d5f498241b3b77beddce3a53ee802c34b1fa46c4";
      fetchSubmodules = false;
      sha256 = "sha256-NpT4SUUq7JfenAfz+XvV/My2rxTntX99zdwp9RKcySo=";
    };
    date = "2023-03-28";
  };
  nvim-numbertoggle = {
    pname = "nvim-numbertoggle";
    version = "1dcc1507578f6f216917065da9dac169670dbcd3";
    src = fetchFromGitHub {
      owner = "sitiom";
      repo = "nvim-numbertoggle";
      rev = "1dcc1507578f6f216917065da9dac169670dbcd3";
      fetchSubmodules = false;
      sha256 = "sha256-AYuSdolDXPZC2hZ7i/Mgg3iAP0SYrn7PcIGpDHXTn7c=";
    };
    date = "2023-05-02";
  };
  osc52 = {
    pname = "osc52";
    version = "0.1.0.0";
    src = fetchFromGitHub {
      owner = "wrvsrx";
      repo = "osc52";
      rev = "0.1.0.0";
      fetchSubmodules = false;
      sha256 = "sha256-JAhA7bdzcRWokvHjMt5Hk6uwOkNFxalQ2xe0Z4bzRp4=";
    };
  };
  taskwarrior-to-dot = {
    pname = "taskwarrior-to-dot";
    version = "ce707be843f4e6e19b1b5462392e927314f2ced4";
    src = fetchFromGitHub {
      owner = "wrvsrx";
      repo = "taskwarrior-to-dot";
      rev = "ce707be843f4e6e19b1b5462392e927314f2ced4";
      fetchSubmodules = false;
      sha256 = "sha256-QpLFmYq8U2KDU85Bz6YllBvqtbXcfEJSzLpXP4Qdp5Q=";
    };
    date = "2023-05-28";
  };
  vdirsyncer = {
    pname = "vdirsyncer";
    version = "46c5622291136be6393654786a6895524e80600f";
    src = fetchFromGitHub {
      owner = "wrvsrx";
      repo = "vdirsyncer";
      rev = "46c5622291136be6393654786a6895524e80600f";
      fetchSubmodules = false;
      sha256 = "sha256-IrKMIEZQiccO3//Twh6oG5YS/ybIwNZD3nTaIPfEsDE=";
    };
    date = "2023-05-06";
  };
  xclip = {
    pname = "xclip";
    version = "b372f73579d30f9ba998ffd0a73694e7abe2c313";
    src = fetchFromGitHub {
      owner = "astrand";
      repo = "xclip";
      rev = "b372f73579d30f9ba998ffd0a73694e7abe2c313";
      fetchSubmodules = false;
      sha256 = "sha256-pBGRV2h7JiNZ4Im3NySEq1UGNW65MpvTjpTxy0m8jc4=";
    };
    date = "2022-01-29";
  };
}
