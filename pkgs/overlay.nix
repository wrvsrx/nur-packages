{ inputs }:
final: prev:
let
  inherit (final) callPackage;
  sources = callPackage ./_sources/generated.nix { };
  callIFD = import ./callIFD.nix;
  mkNotoCJK = callPackage ./noto-fonts-cjk { };
  toplevelPackages =
    {
      # toplevel packages
      auth-thu = callPackage ./auth-thu { };
      autodiff = callPackage ./autodiff { source = sources.autodiff; };
      noto-fonts-cjk-sans-fix-weight = mkNotoCJK { source = sources.noto-fonts-cjk-sans-fix-weight; };
      noto-fonts-cjk-serif-fix-weight = mkNotoCJK { source = sources.noto-fonts-cjk-serif-fix-weight; };
      cyCodeBase = callPackage ./cyCodeBase { source = sources.cyCodeBase; };
      hougeo = callPackage ./hougeo { source = sources.hougeo; };
      happly = callPackage ./happly { source = sources.happly; };
      cnpy = callPackage ./cnpy { source = sources.cnpy; };
      amgcl = callPackage ./amgcl { source = sources.amgcl; };
      cuda-samples-common = callPackage ./cuda-samples-common { cudaPackages = prev.cudaPackages_12_3; };
      structopt = callPackage ./structopt { source = sources.structopt; };
      utfcpp = callPackage ./utfcpp { source = sources.utfcpp; };
      seal_lake = callPackage ./seal_lake { source = sources.seal_lake; };
      sfun = callPackage ./sfun {
        source = sources.sfun;
      };
      cmdlime = callPackage ./cmdlime {
        source = sources.cmdlime;
      };
      rsshub = callPackage ./rsshub { };
      yalantinglibs = callPackage ./yalantinglibs { source = sources.yalantinglibs; };
      baikal = callPackage ./baikal { };
      yuzu = import ./yuzu {
        sources = {
          inherit (sources) suyu nx_tzdb compat-list;
        };
        pkgs = prev;
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

      # override packages
      pam_ssh_agent_auth = callPackage ./pam_ssh_agent_auth { inherit (prev) pam_ssh_agent_auth; };
      xclip = callPackage ./xclip {
        inherit (prev) xclip;
        source = sources.xclip;
      };
      lyra = callPackage ./lyra { source = sources.lyra; };
      wezterm = callPackage ./wezterm {
        source = sources.wezterm;
        inherit (prev) wezterm;
      };
      librime = callPackage ./librime { inherit (prev) librime; };
      fcitx5-rime = callPackage ./fcitx5-rime {
        inherit (prev) fcitx5-rime;
        inherit (final) librime;
      };
      neovim-unwrapped = callPackage ./neovim-unwrapped { inherit (prev) neovim-unwrapped; };
      p7zip = prev.p7zip.override { enableUnfree = true; };
      remmina = prev.remmina.override { withKf5Wallet = false; };
    }
    # other nur packages
    // (
      let
        linyinfeng = import inputs.linyinfeng { pkgs = prev; };
        ilya-fedin = import inputs.ilya-fedin { pkgs = prev; };
      in
      {
        inherit (linyinfeng)
          wemeet
          lpac
          easylpac
          ;
        inherit (ilya-fedin)
          qt5ct
          qt6ct
          ;
      }
    );
  python-overlay = import ./python-overlay { inherit sources; };
  haskell-overlay = import ./haskell-overlay {
    inherit sources;
    pkgs = prev;
  };
  vim-plugins-overlay = import ./vim-plugins-overlay {
    inherit sources callIFD callPackage;
    inherit (prev.vimUtils) buildVimPlugin;
  };
  rimePackages = callPackage ./rime-packages {
    sources = sources;
    pkgs = prev;
  };
in
toplevelPackages
# nested packages
// {
  pythonPackagesExtensions = prev.pythonPackagesExtensions ++ [ python-overlay ];
  haskellPackages = prev.haskellPackages.extend haskell-overlay;
  vimPlugins = prev.vimPlugins.extend vim-plugins-overlay;
  inherit rimePackages;
  nur-wrvsrx._packageNames = {
    _packageNames = builtins.attrNames toplevelPackages;
    python3Packages._packageNames = builtins.attrNames (
      python-overlay prev.python3.pkgs prev.python3.pkgs
    );
    haskellPackages._packageNames = builtins.attrNames (
      haskell-overlay prev.haskellPackages prev.haskellPackages
    );
    vimPlugins._packageNames = builtins.attrNames (
      vim-plugins-overlay prev.vimUtils.vimPlugins prev.vimUtils.vimPlugins
    );
    rimePackages._packageNames = builtins.attrNames rimePackages;
  };
}
