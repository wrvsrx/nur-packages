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
    version = "1.12.9";
    src = fetchFromGitHub {
      owner = "SillyTavern";
      repo = "SillyTavern";
      rev = "1.12.9";
      fetchSubmodules = false;
      sha256 = "sha256-zC1C6A3+G3ZRlV8T9Hpzwk3N3ZLjcoI3XczhG6ulqds=";
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
  compdb = {
    pname = "compdb";
    version = "0.2.0";
    src = fetchurl {
      url = "https://pypi.org/packages/source/c/compdb/compdb-0.2.0.tar.gz";
      sha256 = "sha256-c0cbrdAeXmnIFvs6Tg0BTwmcKCbuKD31cWzXsZAred0=";
    };
  };
  cuda-samples = {
    pname = "cuda-samples";
    version = "v12.4";
    src = fetchFromGitHub {
      owner = "NVIDIA";
      repo = "cuda-samples";
      rev = "v12.4";
      fetchSubmodules = false;
      sha256 = "sha256-D+kP1OEJ4zR/9wKL+jjAv3TRv1IdX39mhZ1MvobX6F0=";
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
  e3nn-jax = {
    pname = "e3nn-jax";
    version = "0.20.7";
    src = fetchurl {
      url = "https://pypi.org/packages/source/e/e3nn_jax/e3nn_jax-0.20.7.tar.gz";
      sha256 = "sha256-d2TtuZ0ZRl5XSiOFfl+XQgtNcg8GuovBigH58rgwHRw=";
    };
  };
  eyelash_sofle_firmware = {
    pname = "eyelash_sofle_firmware";
    version = "c7c1fe5d477c0fa6c006421e8c2f1bab79d94150";
    src = fetchFromGitHub {
      owner = "wrvsrx";
      repo = "zmk-sofle";
      rev = "c7c1fe5d477c0fa6c006421e8c2f1bab79d94150";
      fetchSubmodules = false;
      sha256 = "sha256-VHgjYR0rNyyvdEJOhYYDDlfZFq6IeU/SyXIbAxhNy1s=";
    };
    date = "2025-01-01";
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
  jax-md = {
    pname = "jax-md";
    version = "0.2.8";
    src = fetchurl {
      url = "https://pypi.org/packages/source/j/jax-md/jax-md-0.2.8.tar.gz";
      sha256 = "sha256-rXTkQ8jomTPjiw4mVLUvf1rqu9gaCTTHZfCUF+qi6Vs=";
    };
  };
  jraph = {
    pname = "jraph";
    version = "0.0.6.dev0";
    src = fetchurl {
      url = "https://pypi.org/packages/source/j/jraph/jraph-0.0.6.dev0.tar.gz";
      sha256 = "sha256-w6w6CyJLNE6202fovDEtlepBv4JdAeoxuA3YwiwN2Lg=";
    };
  };
  keymap-drawer = {
    pname = "keymap-drawer";
    version = "0.19.0";
    src = fetchurl {
      url = "https://pypi.org/packages/source/k/keymap_drawer/keymap_drawer-0.19.0.tar.gz";
      sha256 = "sha256-/+QWhDXJeS/qJGzHb8K9Fa5EyqEl5zI2it/vPl9AtO4=";
    };
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
    version = "Serif2.003";
    src = fetchFromGitHub {
      owner = "notofonts";
      repo = "noto-cjk";
      rev = "Serif2.003";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sparseCheckout = [ "Serif/OTC" ];
      sha256 = "sha256-mfbBSdJrUCZiUUmsmndtEW6H3z6KfBn+dEftBySf2j4=";
    };
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
  rime-ice = {
    pname = "rime-ice";
    version = "d189ef2a68c6e01fad7b264cd0323597c544afe5";
    src = fetchFromGitHub {
      owner = "iDvel";
      repo = "rime-ice";
      rev = "d189ef2a68c6e01fad7b264cd0323597c544afe5";
      fetchSubmodules = false;
      sha256 = "sha256-GMQjEgeXMsqyGLG1Xj9NrT6t3I882g2E5lZbQh+vk18=";
    };
    date = "2024-12-06";
  };
  rime-prelude = {
    pname = "rime-prelude";
    version = "3803f09458072e03b9ed396692ce7e1d35c88c95";
    src = fetchFromGitHub {
      owner = "rime";
      repo = "rime-prelude";
      rev = "3803f09458072e03b9ed396692ce7e1d35c88c95";
      fetchSubmodules = false;
      sha256 = "sha256-qLxkijfB/btd2yhUMbxmoNx6fKxpKYHBZoE7YEUKIu4=";
    };
    date = "2024-05-19";
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
    version = "b32f3de2ad95769966c147a577b275e113223762";
    src = fetchFromGitHub {
      owner = "wrvsrx";
      repo = "task-utils";
      rev = "b32f3de2ad95769966c147a577b275e113223762";
      fetchSubmodules = false;
      sha256 = "sha256-3WbvMm152pCpWvLc+rTHdgELQyN3izAvd7wUv0VVWXE=";
    };
    date = "2024-12-27";
  };
  tree-sitter-devicetree = {
    pname = "tree-sitter-devicetree";
    version = "v0.11.1";
    src = fetchFromGitHub {
      owner = "joelspadin";
      repo = "tree-sitter-devicetree";
      rev = "v0.11.1";
      fetchSubmodules = false;
      sha256 = "sha256-2uJEItLwoBoiB49r2XuO216Dhu9AnAa0p7Plmm4JNY8=";
    };
  };
  ttrss-data-migration = {
    pname = "ttrss-data-migration";
    version = "e13d5f97b4887ce7b57b3d76228d838dec15963d";
    src = fetchgit {
      url = "https://git.tt-rss.org/fox/ttrss-data-migration.git";
      rev = "e13d5f97b4887ce7b57b3d76228d838dec15963d";
      fetchSubmodules = false;
      deepClone = false;
      leaveDotGit = false;
      sparseCheckout = [ ];
      sha256 = "sha256-xnbR5IQ0h7ilxchNj55ROZdq1L7MIAwv3/00k09WTTs=";
    };
    date = "2023-11-01";
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
    version = "202411042211";
    src = fetchurl {
      url = "https://github.com/Loyalsoldier/v2ray-rules-dat/releases/download/202411042211/geoip.dat";
      sha256 = "sha256-m1zcSf7t6vHpEoqMKXNgP1Qs3g/Aa8FWqN45z/Epih8=";
    };
  };
  v2ray-rules-dat-geosite = {
    pname = "v2ray-rules-dat-geosite";
    version = "202411042211";
    src = fetchurl {
      url = "https://github.com/Loyalsoldier/v2ray-rules-dat/releases/download/202411042211/geosite.dat";
      sha256 = "sha256-hnr/RgPFDxhHJy7pGI5hKuKoS0MEZ5Q7Kzit1s7wSHA=";
    };
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
