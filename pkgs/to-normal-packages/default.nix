{ pkgs, to-sources }:
let
  inherit (pkgs) callPackage;
  sources = to-sources { inherit pkgs; };
  callIFD = import ../callIFD.nix;
  mkNotoCJK = callPackage ./noto-fonts-cjk { };
in
rec {
  auth-thu = callPackage ./auth-thu { };
  autodiff = callPackage ./autodiff { source = sources.autodiff; };
  noto-fonts-cjk-sans-fix-weight = mkNotoCJK { source = sources.noto-fonts-cjk-sans-fix-weight; };
  noto-fonts-cjk-serif-fix-weight = mkNotoCJK { source = sources.noto-fonts-cjk-serif-fix-weight; };
  cyCodeBase = callPackage ./cyCodeBase { source = sources.cyCodeBase; };
  hougeo = callPackage ./hougeo { source = sources.hougeo; };
  happly = callPackage ./happly { source = sources.happly; };
  cnpy = callPackage ./cnpy { source = sources.cnpy; };
  amgcl = callPackage ./amgcl { source = sources.amgcl; };
  cuda-samples-common = callPackage ./cuda-samples-common { cudaPackages = pkgs.cudaPackages_12_3; };
  structopt = callPackage ./structopt { source = sources.structopt; };
  utfcpp = callPackage ./utfcpp { source = sources.utfcpp; };
  seal_lake = callPackage ./seal_lake { source = sources.seal_lake; };
  sfun = callPackage ./sfun {
    source = sources.sfun;
    inherit utfcpp seal_lake;
  };
  cmdlime = callPackage ./cmdlime {
    source = sources.cmdlime;
    inherit sfun seal_lake;
  };
  rsshub = callPackage ./rsshub { };
  yalantinglibs = callPackage ./yalantinglibs { source = sources.yalantinglibs; };
  baikal = callPackage ./baikal { };
  yuzu = import ./yuzu {
    sources = {
      inherit (sources) suyu nx_tzdb compat-list;
    };
    inherit pkgs;
  };
  SillyTavern = callPackage ./SillyTavern { source = sources.SillyTavern; };
  vscode-markdown-languageserver = callPackage ./vscode-markdown-languageserver {
    source = sources.vscode-markdown-languageserver;
  };
  v2ray-rules-dat = callPackage ./v2ray-rules-dat {
    inherit (sources) v2ray-rules-dat-geoip v2ray-rules-dat-geosite;
  };

  # my packages
  giraffe-wallpaper = callIFD {
    inherit callPackage;
    source = sources.giraffe-wallpaper;
    otherArgs = {
      width = 3840;
      height = 2160;
    };
  };
  sofle-firmware = callPackage ./sofle-firmware {
    west2nix = sources.west2nix.src;
    zephyr-nix = sources.zephyr-nix.src;
    pyproject-nix = sources.pyproject-nix.src;
    source = sources.sofle-firmware;
  };
}
