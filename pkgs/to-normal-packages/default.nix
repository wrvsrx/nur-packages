{ pkgs, to-sources }:
let
  inherit (pkgs) callPackage haskellPackages;
  sources = to-sources { inherit pkgs; };
in
rec {
  auth-thu = callPackage ./auth-thu { };
  autodiff = callPackage ./autodiff { source = sources.autodiff; };
  inherit (callPackage ./noto-fonts-cjk { })
    noto-fonts-cjk-sans-fix-weight
    noto-fonts-cjk-serif-fix-weight;
  noto-fonts-emoji-monochrome = callPackage ./noto-fonts-emoji-monochrome { source = sources.noto-fonts-emoji-monochrome; };
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
  sfun = callPackage ./sfun { source = sources.sfun; inherit utfcpp seal_lake; };
  cmdlime = callPackage ./cmdlime { source = sources.cmdlime; inherit sfun seal_lake; };
  cccl = callPackage ./cccl { source = sources.cccl; };
  rsshub = callPackage ./rsshub { };

  # my packages
  giraffe-wallpaper = callPackage ./giraffe-wallpaper { source = sources.giraffe-wallpaper; };
  osc52 = haskellPackages.callPackage ./osc52 { source = sources.osc52; };
  taskwarrior-utils = haskellPackages.callPackage ./taskwarrior-utils { source = sources.taskwarrior-utils; };
  copy-trime-data-to = callPackage ./copy-trime-data-to { inherit trime-data; };
  yalantinglibs = callPackage ./yalantinglibs { source = sources.yalantinglibs; };
  calendar-visualization = haskellPackages.callPackage ./calendar-visualization { source = sources.calendar-visualization; };
}
