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
  SillyTavern = {
    pname = "SillyTavern";
    version = "1.12.4";
    src = fetchFromGitHub {
      owner = "SillyTavern";
      repo = "SillyTavern";
      rev = "1.12.4";
      fetchSubmodules = false;
      sha256 = "sha256-jjBeEK/E2PIvtDJB4r4HJcVH2PspAUeF0+0JQA5h4Ss=";
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
    version = "099535c19755f7f26cc9dd7651dbb8e201783e9f";
    src = fetchFromGitHub {
      owner = "wrvsrx";
      repo = "calendar-visualization";
      rev = "099535c19755f7f26cc9dd7651dbb8e201783e9f";
      fetchSubmodules = false;
      sha256 = "sha256-PcOeBPW53BtZSuz0AD+jMmlGlFvZBaZT71AFo83wRJU=";
    };
    date = "2024-05-02";
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
  coc-markdown = {
    pname = "coc-markdown";
    version = "2b9e5e7cdf2e6d027ab226c36e1175ad5030ce62";
    src = fetchFromGitHub {
      owner = "wrvsrx";
      repo = "coc-markdown";
      rev = "2b9e5e7cdf2e6d027ab226c36e1175ad5030ce62";
      fetchSubmodules = false;
      sha256 = "sha256-LzH2g0T8eqcjsGcv6kYHpbuymmzLOFhB0GWGTdtW0AM=";
    };
    date = "2024-07-15";
  };
  coc-zk = {
    pname = "coc-zk";
    version = "0e6b90d1809514e853a8e80245b9e7eec71117c6";
    src = fetchFromGitHub {
      owner = "wrvsrx";
      repo = "coc-zk";
      rev = "0e6b90d1809514e853a8e80245b9e7eec71117c6";
      fetchSubmodules = false;
      sha256 = "sha256-zdHLynunpi+gxUUYVlslcQ6ckSg3dDmdz/aSdrJFte0=";
    };
    date = "2024-07-15";
  };
  compat-list = {
    pname = "compat-list";
    version = "4abf1d239aba843180abfed58fa8541432fece5b";
    src = fetchFromGitHub {
      owner = "flathub";
      repo = "org.yuzu_emu.yuzu";
      rev = "4abf1d239aba843180abfed58fa8541432fece5b";
      fetchSubmodules = false;
      sha256 = "sha256-rBnsW8ijDEPCXzIkbfQnyhSFhIv91+jIkNPosVHJ2UY=";
    };
    date = "2024-03-04";
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
    version = "8a606309daaa680eee495c8279feb0b704148f4a";
    src = fetchFromGitHub {
      owner = "nmwsharp";
      repo = "happly";
      rev = "8a606309daaa680eee495c8279feb0b704148f4a";
      fetchSubmodules = false;
      sha256 = "sha256-KKQdvRxqSXq3Q0TlcpDr+YGlUV3oP7PaE1V2KoP0rXg=";
    };
    date = "2024-02-06";
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
  iCalendar = {
    pname = "iCalendar";
    version = "e2f5f700294ae0d205b6bf2e372f3a99f801d7fc";
    src = fetchFromGitHub {
      owner = "wrvsrx";
      repo = "iCalendar";
      rev = "e2f5f700294ae0d205b6bf2e372f3a99f801d7fc";
      fetchSubmodules = false;
      sha256 = "sha256-e2aZr8Vh/HJnTV8GwIDMzGTZBZdYf72NtapHElHw0gg=";
    };
    date = "2024-04-13";
  };
  linediff-vim = {
    pname = "linediff-vim";
    version = "ddae71ef5f94775d101c1c70032ebe8799f32745";
    src = fetchgit {
      url = "https://github.com/AndrewRadev/linediff.vim";
      rev = "ddae71ef5f94775d101c1c70032ebe8799f32745";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sparseCheckout = [ ];
      sha256 = "sha256-ZyQzLpzvS887J1Gdxv1edC9MhPj1EEITh27rUPuFugU=";
    };
    date = "2024-04-22";
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
  noto-fonts-cjk-sans-fix-weight = {
    pname = "noto-fonts-cjk-sans-fix-weight";
    version = "Sans2.004";
    src = fetchFromGitHub {
      owner = "notofonts";
      repo = "noto-cjk";
      rev = "Sans2.004";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sparseCheckout = [ "Sans/OTC" ];
      sha256 = "sha256-GXULnRPsIJRdiL3LdFtHbqTqSvegY2zodBxFm4P55to=";
    };
  };
  noto-fonts-cjk-serif-fix-weight = {
    pname = "noto-fonts-cjk-serif-fix-weight";
    version = "Serif2.002";
    src = fetchFromGitHub {
      owner = "notofonts";
      repo = "noto-cjk";
      rev = "Serif2.002";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sparseCheckout = [ "Serif/OTC" ];
      sha256 = "sha256-ihbhbv875XEHupFUzIdEweukqEmwQXCXCiTG7qisE64=";
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
    version = "c5827153f8a955886f1b38eaea6998c067d2992f";
    src = fetchFromGitHub {
      owner = "sitiom";
      repo = "nvim-numbertoggle";
      rev = "c5827153f8a955886f1b38eaea6998c067d2992f";
      fetchSubmodules = false;
      sha256 = "sha256-IkJ9KRrikJZvijjfqgnJ2/QYAuF8KX2/zFX1oUbE3aI=";
    };
    date = "2024-03-29";
  };
  nx_tzdb = {
    pname = "nx_tzdb";
    version = "221202";
    src = fetchurl {
      url = "https://github.com/lat9nq/tzdb_to_nx/releases/download/221202/221202.zip";
      sha256 = "sha256-mRzW+iIwrU1zsxHmf+0RArU8BShAoEMvCz+McXFFK3c=";
    };
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
  rsshub = {
    pname = "rsshub";
    version = "9fd5c42951983918e488ff364d7e07e1bd64fe5d";
    src = fetchFromGitHub {
      owner = "DIYGod";
      repo = "RSSHub";
      rev = "9fd5c42951983918e488ff364d7e07e1bd64fe5d";
      fetchSubmodules = false;
      sha256 = "sha256-C0RME1RCdjcThUQbqsIobmVQDViJcBSAL46z2E95M0E=";
    };
    date = "2024-06-09";
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
    version = "696db97f672e9082e50e50af315d0f4234c82397";
    src = fetchFromGitHub {
      owner = "gabime";
      repo = "spdlog";
      rev = "696db97f672e9082e50e50af315d0f4234c82397";
      fetchSubmodules = false;
      sha256 = "sha256-17k5di2NLwrkCBHa6esYV3703e+DQhj0NjOgQ5pnI/Q=";
    };
    date = "2024-01-16";
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
  task-utils = {
    pname = "task-utils";
    version = "98b4315ec21a03341891bcafff9151f7e323fda8";
    src = fetchFromGitHub {
      owner = "wrvsrx";
      repo = "task-utils";
      rev = "98b4315ec21a03341891bcafff9151f7e323fda8";
      fetchSubmodules = false;
      sha256 = "sha256-cxHyMYfpJvMnSB7HMtoNRWq+Rb3L0z65TI5zjvRG67s=";
    };
    date = "2024-09-25";
  };
  utfcpp = {
    pname = "utfcpp";
    version = "v4.0.5";
    src = fetchFromGitHub {
      owner = "nemtrif";
      repo = "utfcpp";
      rev = "v4.0.5";
      fetchSubmodules = false;
      sha256 = "sha256-oKVFUjCvkHjqifZe98aUe68IBUaAZYWU2S2rxyAA9Cg=";
    };
  };
  v2ray-rules-dat-geoip = {
    pname = "v2ray-rules-dat-geoip";
    version = "202408132210";
    src = fetchurl {
      url = "https://github.com/Loyalsoldier/v2ray-rules-dat/releases/download/202408132210/geoip.dat";
      sha256 = "sha256-k7TxQUPA67g306gvsUYVxhXuQMkuVuFCccG6BHMx1co=";
    };
  };
  v2ray-rules-dat-geosite = {
    pname = "v2ray-rules-dat-geosite";
    version = "202408132210";
    src = fetchurl {
      url = "https://github.com/Loyalsoldier/v2ray-rules-dat/releases/download/202408132210/geosite.dat";
      sha256 = "sha256-IOHnLdd6PhvQerRtTr9P0vvGOVC9cGbReot9UNZUv/E=";
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
  vscode-markdown-languageserver = {
    pname = "vscode-markdown-languageserver";
    version = "v0.5.0-alpha.7";
    src = fetchFromGitHub {
      owner = "microsoft";
      repo = "vscode-markdown-languageserver";
      rev = "v0.5.0-alpha.7";
      fetchSubmodules = false;
      sha256 = "sha256-qBXpBGdh8ehk/94nbE5Y9ispEz/d5DMXl1OVEH8AmCU=";
    };
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
    version = "v0.3.0";
    src = fetchFromGitHub {
      owner = "alibaba";
      repo = "yalantinglibs";
      rev = "v0.3.0";
      fetchSubmodules = false;
      sha256 = "sha256-Su3mnC7hsw0T0u6HfsnYAwXml2T7CABySv7a18+KnK0=";
    };
  };
}
