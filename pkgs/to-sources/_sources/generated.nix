# This file was generated by nvfetcher, please do not modify it manually.
{ fetchgit, fetchurl, fetchFromGitHub, dockerTools }:
{
  OpenEXR = {
    pname = "OpenEXR";
    version = "1.3.9";
    src = fetchurl {
      url = "https://pypi.org/packages/source/O/OpenEXR/OpenEXR-1.3.9.tar.gz";
      sha256 = "sha256-z/zROQYpHvGoGzacHA6Qdkjs0kNjZohzaR9EhmcEqyE=";
    };
  };
  amgcl = {
    pname = "amgcl";
    version = "1.4.4";
    src = fetchFromGitHub {
      owner = "ddemidov";
      repo = "amgcl";
      rev = "1.4.4";
      fetchSubmodules = false;
      sha256 = "sha256-PSIWbOyBtJTVslp3tP5YX81YzTQC5DCfs4WhwwmwFew=";
    };
  };
  autobean-format = {
    pname = "autobean-format";
    version = "7849d89eefb433036736bbb1c3168eb02337d34c";
    src = fetchFromGitHub {
      owner = "SEIAROTg";
      repo = "autobean-format";
      rev = "7849d89eefb433036736bbb1c3168eb02337d34c";
      fetchSubmodules = false;
      sha256 = "sha256-UvPHcJjgLJzhvh+CGPO8oco0eXc5gTJ1wHXV5pYwnV0=";
    };
    date = "2023-09-17";
  };
  autobean-refactor = {
    pname = "autobean-refactor";
    version = "36fedaf8e7104d6da06b28936bcf6dae2b5267bf";
    src = fetchFromGitHub {
      owner = "SEIAROTg";
      repo = "autobean-refactor";
      rev = "36fedaf8e7104d6da06b28936bcf6dae2b5267bf";
      fetchSubmodules = false;
      sha256 = "sha256-MxCVuk7kuAA0GixII4XbWGPDk54mwKUeK7s0gGVgnF8=";
    };
    date = "2023-07-01";
  };
  autodiff = {
    pname = "autodiff";
    version = "v1.0.3";
    src = fetchFromGitHub {
      owner = "autodiff";
      repo = "autodiff";
      rev = "v1.0.3";
      fetchSubmodules = false;
      sha256 = "sha256-hdIbEIZrxA5EA3XY4MIazRv3DazUjpuDJRCgq8+kJQg=";
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
  cnpy = {
    pname = "cnpy";
    version = "4e8810b1a8637695171ed346ce68f6984e585ef4";
    src = fetchFromGitHub {
      owner = "rogersce";
      repo = "cnpy";
      rev = "4e8810b1a8637695171ed346ce68f6984e585ef4";
      fetchSubmodules = false;
      sha256 = "sha256-NMPDpeNoqvqAhwQk4J+TFw+BtNLI4R+CXpzXQ6hB/LU=";
    };
    date = "2018-05-31";
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
  cyCodeBase = {
    pname = "cyCodeBase";
    version = "ede026f5c1976faa90709690a4290161ed05c19b";
    src = fetchFromGitHub {
      owner = "cemyuksel";
      repo = "cyCodeBase";
      rev = "ede026f5c1976faa90709690a4290161ed05c19b";
      fetchSubmodules = false;
      sha256 = "sha256-1wBpadgCNbcrp4kRn4XLjbthtxuzMuOMNC/hbREHbiE=";
    };
    date = "2023-07-26";
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
  googletrans = {
    pname = "googletrans";
    version = "4.0.0rc1";
    src = fetchurl {
      url = "https://pypi.org/packages/source/g/googletrans/googletrans-4.0.0rc1.tar.gz";
      sha256 = "sha256-dN9HsJLi1WZSIBnRSePx11cyVwrXbq+OFK6+/8Emw3I=";
    };
  };
  happly = {
    pname = "happly";
    version = "cfa2611550bc7da65855a78af0574b65deb81766";
    src = fetchFromGitHub {
      owner = "nmwsharp";
      repo = "happly";
      rev = "cfa2611550bc7da65855a78af0574b65deb81766";
      fetchSubmodules = false;
      sha256 = "sha256-fHExfJ6WpOHEvFw4M9l9Ur1AaHQfSlzaKcq4dylYhpk=";
    };
    date = "2022-01-06";
  };
  hougeo = {
    pname = "hougeo";
    version = "7e48d2bda0f94fc96b2d8b2917d5ef306ba83c97";
    src = fetchFromGitHub {
      owner = "nyue";
      repo = "hougeo";
      rev = "7e48d2bda0f94fc96b2d8b2917d5ef306ba83c97";
      fetchSubmodules = false;
      sha256 = "sha256-QbPT7oJH835hfdP+o2ON9gQliuktDu4vmS5zzyG8Wfg=";
    };
    date = "2015-10-31";
  };
  jaxtyping = {
    pname = "jaxtyping";
    version = "0.2.22";
    src = fetchurl {
      url = "https://pypi.org/packages/source/j/jaxtyping/jaxtyping-0.2.22.tar.gz";
      sha256 = "sha256-rfCmswmOx6IBZa29wBnpDxtSSURiNntdEsCl6iVV0iM=";
    };
  };
  lyra = {
    pname = "lyra";
    version = "1.6.1";
    src = fetchFromGitHub {
      owner = "bfgroup";
      repo = "Lyra";
      rev = "1.6.1";
      fetchSubmodules = false;
      sha256 = "sha256-tS2SPLiKaL8C35AmOXyJPstFUfynkE/A53rurqiySbI=";
    };
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
    version = "50fef7e421a27294e834084625ad0dd8cffee72c";
    src = fetchFromGitHub {
      owner = "sitiom";
      repo = "nvim-numbertoggle";
      rev = "50fef7e421a27294e834084625ad0dd8cffee72c";
      fetchSubmodules = false;
      sha256 = "sha256-QBK3blWxY6RBIDgRM/Wig+D1KX/zOkmnNGF1Xz2x8tg=";
    };
    date = "2023-09-05";
  };
  osc52 = {
    pname = "osc52";
    version = "477b99c8a1053183ede9978b2fe00dbcdb7c4b91";
    src = fetchFromGitHub {
      owner = "wrvsrx";
      repo = "osc52";
      rev = "477b99c8a1053183ede9978b2fe00dbcdb7c4b91";
      fetchSubmodules = false;
      sha256 = "sha256-A4SIzkKs02csNGaETmU/9P0n8mjx6hjeTUbTjSi8unI=";
    };
    date = "2023-09-12";
  };
  quill-cpp = {
    pname = "quill-cpp";
    version = "v3.3.1";
    src = fetchFromGitHub {
      owner = "odygrd";
      repo = "quill";
      rev = "v3.3.1";
      fetchSubmodules = false;
      sha256 = "sha256-aPGAinaws60aGinUD926QgM3Mywym7tnNXJRq1xtXA0=";
    };
  };
  taskwarrior-utils = {
    pname = "taskwarrior-utils";
    version = "8128ff22e672de756f1904031cd258587eadb5f4";
    src = fetchFromGitHub {
      owner = "wrvsrx";
      repo = "taskwarrior-to-dot";
      rev = "8128ff22e672de756f1904031cd258587eadb5f4";
      fetchSubmodules = false;
      sha256 = "sha256-KndkuGNGLDAMcn1duWnuhAMhtQDo27+MjiTOVfWOJYg=";
    };
    date = "2023-08-24";
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
