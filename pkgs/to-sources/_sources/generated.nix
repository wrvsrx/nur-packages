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
  calendar-visualization = {
    pname = "calendar-visualization";
    version = "50b9a4ef9ceec28fcfe5320a828730f88c1e0de8";
    src = fetchFromGitHub {
      owner = "wrvsrx";
      repo = "calendar-visualization";
      rev = "50b9a4ef9ceec28fcfe5320a828730f88c1e0de8";
      fetchSubmodules = false;
      sha256 = "sha256-MWd7B3UfyQHabVdxw3jU3yPS6yrDB2ePU+VdivNVbIQ=";
    };
    date = "2023-12-09";
  };
  cmdlime = {
    pname = "cmdlime";
    version = "80d9673456b4cb8223ad9cf176ec88d61a388c70";
    src = fetchFromGitHub {
      owner = "kamchatka-volcano";
      repo = "cmdlime";
      rev = "80d9673456b4cb8223ad9cf176ec88d61a388c70";
      fetchSubmodules = false;
      sha256 = "sha256-SHum/OoVEaktqmR7tgNozGSQ8Ct14FHeycuL8mAnZbM=";
    };
    date = "2023-08-29";
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
    version = "72b621c0c78d6f9862771a0156aee694714ff414";
    src = fetchFromGitHub {
      owner = "wrvsrx";
      repo = "coc-zk";
      rev = "72b621c0c78d6f9862771a0156aee694714ff414";
      fetchSubmodules = false;
      sha256 = "sha256-Az3rMCaw0nuGL3NByD/AD3ho0OdYK88Jz1H8d3S2S2g=";
    };
    date = "2023-11-28";
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
    version = "0.2.23";
    src = fetchurl {
      url = "https://pypi.org/packages/source/j/jaxtyping/jaxtyping-0.2.23.tar.gz";
      sha256 = "sha256-imZiV+pbMzu3SFWY/TMSQg+t6xk7im+eT+D9xRtk35Q=";
    };
  };
  lyra = {
    pname = "lyra";
    version = "a8bb6e22ea4dcd507292ecdb6443bad23ef7bfeb";
    src = fetchFromGitHub {
      owner = "bfgroup";
      repo = "Lyra";
      rev = "a8bb6e22ea4dcd507292ecdb6443bad23ef7bfeb";
      fetchSubmodules = false;
      sha256 = "sha256-8Y2p6A73UvWr0mKVgMW5LchRRp5DtAg/R1vZB6q2zOA=";
    };
    date = "2023-04-23";
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
    version = "9ab95e60ea5ec138e1b2332e0fc18b8e5de464c6";
    src = fetchFromGitHub {
      owner = "sitiom";
      repo = "nvim-numbertoggle";
      rev = "9ab95e60ea5ec138e1b2332e0fc18b8e5de464c6";
      fetchSubmodules = false;
      sha256 = "sha256-1QImFgjpfsLJ6xxb1HZPQdBH/QGPtYs5bQ7v5Mxa/nY=";
    };
    date = "2023-10-09";
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
  seal_lake = {
    pname = "seal_lake";
    version = "ca84d624a8280c5354ea4d90cd29648804c6c489";
    src = fetchFromGitHub {
      owner = "kamchatka-volcano";
      repo = "seal_lake";
      rev = "ca84d624a8280c5354ea4d90cd29648804c6c489";
      fetchSubmodules = false;
      sha256 = "sha256-h146QkqgOuZkqj8mJwuMVVbE+dclQrT3bo9dp3K0QUU=";
    };
    date = "2023-01-18";
  };
  sfun = {
    pname = "sfun";
    version = "v5.0.0";
    src = fetchFromGitHub {
      owner = "kamchatka-volcano";
      repo = "sfun";
      rev = "v5.0.0";
      fetchSubmodules = false;
      sha256 = "sha256-HJo7rlKv0NaF6hC46EK5xlcAlCXeQIQiXRJaQoANqpA=";
    };
  };
  spdlog = {
    pname = "spdlog";
    version = "1ef8d3ce348daf5d580e27fc68e91628ce42c1f4";
    src = fetchFromGitHub {
      owner = "gabime";
      repo = "spdlog";
      rev = "1ef8d3ce348daf5d580e27fc68e91628ce42c1f4";
      fetchSubmodules = false;
      sha256 = "sha256-vdKPRiicSnCcuaYDw+0XqM9FACCMelrL5TQY/H1KeUM=";
    };
    date = "2024-01-01";
  };
  structopt = {
    pname = "structopt";
    version = "v0.1.3";
    src = fetchFromGitHub {
      owner = "p-ranav";
      repo = "structopt";
      rev = "v0.1.3";
      fetchSubmodules = false;
      sha256 = "sha256-AyWtJ+EyTN2LEXLM5OSQB3ITzqLLRoirzkWnjwLHOIA=";
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
  utfcpp = {
    pname = "utfcpp";
    version = "v4.0.3";
    src = fetchFromGitHub {
      owner = "nemtrif";
      repo = "utfcpp";
      rev = "v4.0.3";
      fetchSubmodules = false;
      sha256 = "sha256-QVSgBlZWRcHnMFAAshdWmfbIJlqP2a+zQXiIPgzpiGc=";
    };
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
  yalantinglibs = {
    pname = "yalantinglibs";
    version = "v0.2.6";
    src = fetchFromGitHub {
      owner = "alibaba";
      repo = "yalantinglibs";
      rev = "v0.2.6";
      fetchSubmodules = false;
      sha256 = "sha256-2so/OMBC2IptIXHvV2d79JVn2AIOonkaHBRKZvQy+PQ=";
    };
  };
}
