{ pkgs, to-sources }:
let
  inherit (pkgs) callPackage;
  sources = to-sources { inherit pkgs; };
  callIFD = import ../callIFD.nix;
  mkNotoCJK = callPackage ./noto-fonts-cjk { };
  pnpm_9_1_4 = pkgs.callPackage "${pkgs.path}/pkgs/development/tools/pnpm/generic.nix" {
    version = "9.1.4";
    hash = "sha256-MKGAGsTnI3ee/tE6IfTDn562yfu0ztEBvOBrQiWT18k=";
  };
in
rec {
  auth-thu = callPackage ./auth-thu { };
  autodiff = callPackage ./autodiff { source = sources.autodiff; };
  noto-fonts-cjk-sans-fix-weight = mkNotoCJK { source = sources.noto-fonts-cjk-sans-fix-weight; };
  noto-fonts-cjk-serif-fix-weight = mkNotoCJK { source = sources.noto-fonts-cjk-serif-fix-weight; };
  noto-fonts-emoji-monochrome = callPackage ./noto-fonts-emoji-monochrome {
    source = sources.noto-fonts-emoji-monochrome;
  };
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
