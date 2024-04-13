{ pkgs, to-sources }:
let
  inherit (pkgs) callPackage haskellPackages qt6Packages;
  sources = to-sources { inherit pkgs; };
  callIFD = import ../callIFD.nix;
in
rec {
  auth-thu = callPackage ./auth-thu { source = sources.auth-thu; };
  autodiff = callPackage ./autodiff { source = sources.autodiff; };
  inherit (callPackage ./noto-fonts-cjk { })
    noto-fonts-cjk-sans-fix-weight
    noto-fonts-cjk-serif-fix-weight
    ;
  noto-fonts-emoji-monochrome = callPackage ./noto-fonts-emoji-monochrome {
    source = sources.noto-fonts-emoji-monochrome;
  };
  cyCodeBase = callPackage ./cyCodeBase { source = sources.cyCodeBase; };
  trime-data = callPackage ./trime-data { };
  hougeo = callPackage ./hougeo { source = sources.hougeo; };
  happly = callPackage ./happly { source = sources.happly; };
  cnpy = callPackage ./cnpy { source = sources.cnpy; };
  amgcl = callPackage ./amgcl { source = sources.amgcl; };
  cuda-samples = callPackage ./cuda-samples { };
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
  cccl = callPackage ./cccl { source = sources.cccl; };
  rsshub = callPackage ./rsshub {
    source = sources.rsshub;
    inherit (pkgs) mkPnpmPackage;
  };
  metacubexd = callPackage ./metacubexd { source = sources.metacubexd; };
  yalantinglibs = callPackage ./yalantinglibs { source = sources.yalantinglibs; };
  nx_tzdb = callPackage ./nx_tzdb { source = sources.nx_tzdb; };
  compat-list = callPackage ./compat-list { source = sources.compat-list; };
  yuzu-early-access = qt6Packages.callPackage ./yuzu-earyly-access {
    source = sources.yuzu;
    inherit nx_tzdb compat-list;
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
}
