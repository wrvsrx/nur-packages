{ inputs }:
final: prev:
let
  inherit (final) callPackage;
  sources = callPackage ./_sources/generated.nix { };
  callIFD = import ./callIFD.nix;
  mkNotoCJK =
    { source }:
    let
      ver = source.version;
      typeface = builtins.substring 0 (builtins.stringLength ver - 5) ver;
      version = builtins.substring (builtins.stringLength ver - 5) 5 ver;
      pkg = prev."noto-fonts-cjk-${prev.lib.strings.toLower typeface}";
    in
    pkg.overrideAttrs {
      inherit (source) src;
      inherit version;
      installPhase = ''
        install -m444 -Dt $out/share/fonts/opentype/noto-cjk ${typeface}/OTC/*.ttc
      '';
    };
  toplevelPackages =
    {
      # toplevel packages
      auth-thu = callPackage ./auth-thu { };
      autodiff = callPackage ./autodiff { source = sources.autodiff; };
      noto-fonts-cjk-sans-fix-weight = mkNotoCJK {
        source = sources.noto-fonts-cjk-sans-fix-weight;
      };
      noto-fonts-cjk-serif-fix-weight = mkNotoCJK {
        source = sources.noto-fonts-cjk-serif-fix-weight;
      };
      cyCodeBase = callPackage ./cyCodeBase { source = sources.cyCodeBase; };
      hougeo = callPackage ./hougeo { source = sources.hougeo; };
      happly = callPackage ./happly { source = sources.happly; };
      cnpy = callPackage ./cnpy { source = sources.cnpy; };
      amgcl = callPackage ./amgcl { source = sources.amgcl; };
      cuda-samples-common = callPackage ./cuda-samples-common {
        source = sources.cuda-samples;
      };
      structopt = callPackage ./structopt { source = sources.structopt; };
      utfcpp = callPackage ./utfcpp { source = sources.utfcpp; };
      seal_lake = callPackage ./seal_lake { source = sources.seal_lake; };
      sfun = callPackage ./sfun {
        source = sources.sfun;
      };
      cmdlime = callPackage ./cmdlime {
        source = sources.cmdlime;
      };
      yalantinglibs = callPackage ./yalantinglibs { source = sources.yalantinglibs; };
      baikal = callPackage ./baikal { };
      SillyTavern = callPackage ./SillyTavern { source = sources.SillyTavern; };
      vscode-markdown-languageserver = callPackage ./vscode-markdown-languageserver {
        source = sources.vscode-markdown-languageserver;
      };
      v2ray-rules-dat = callPackage ./v2ray-rules-dat {
        inherit (sources) v2ray-rules-dat-geoip v2ray-rules-dat-geosite;
      };
      ttrss-data-migration = callPackage ./ttrss-data-migration {
        source = sources.ttrss-data-migration;
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
      eyelash_sofle_firmware = callPackage ./eyelash_sofle_firmware {
        source = sources.eyelash_sofle_firmware;
        inherit (final.python3Packages) keymap-drawer;
      };

      # override packages
      pam_ssh_agent_auth = callPackage ./pam_ssh_agent_auth { inherit (prev) pam_ssh_agent_auth; };
      xclip = callPackage ./xclip {
        inherit (prev) xclip;
        source = sources.xclip;
      };
      lyra = callPackage ./lyra { source = sources.lyra; };
      librime = callPackage ./librime { inherit (prev) librime; };
      fcitx5-rime = callPackage ./fcitx5-rime {
        inherit (prev) fcitx5-rime;
        inherit (final) librime;
      };
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
