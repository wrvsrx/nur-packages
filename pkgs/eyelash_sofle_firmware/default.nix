{
  stdenv,
  stdenvNoCC,
  keymap-drawer,
  callPackage,
  cmake,
  ninja,
  gitMinimal,
  lib,
  symlinkJoin,
  qemu,
  runCommand,
  python3,
  source,
  fetchFromGitHub,
}:

let
  inherit (source) src;
  lock = builtins.fromJSON (builtins.readFile "${src}/flake.lock");
  toSource =
    nodeName:
    fetchFromGitHub {
      owner = lock.nodes.${nodeName}.locked.owner;
      repo = lock.nodes.${nodeName}.locked.repo;
      rev = lock.nodes.${nodeName}.locked.rev;
      sha256 = lock.nodes.${nodeName}.locked.narHash;
    };
  west2nix = callPackage (toSource "west2nix") { };
  pyproject-nix = callPackage (toSource "pyproject-nix") { };
  zephyr = callPackage (toSource "zephyr-nix") {
    inherit pyproject-nix;
  };
  inherit (west2nix) mkWest2nixHook;
  west2nixHook = mkWest2nixHook {
    manifest = "${src}/west2nix.toml";
  };
  buildSofle =
    {
      name ? board,
      board,
      shields,
    }:
    stdenv.mkDerivation {
      inherit name;
      src = ./.;
      nativeBuildInputs = [
        west2nixHook
        (zephyr.pythonEnv.override {
          # use python3 after nur overlay
          inherit python3;
          zephyr-src =
            (lib.lists.findFirst (x: x.name == "zephyr") null west2nixHook.projectsWithFakeGit).src;
        })
        zephyr.hosttools-nix
        gitMinimal
        cmake
        ninja
      ];
      buildInputs = [
        (zephyr.sdk.override {
          targets = [
            "arm-zephyr-eabi"
          ];
        })
      ];
      westBuildFlags = [
        "-s"
        "../zmk/app"
        "-b"
        board
        "--"
        ("-DZMK_CONFIG=${./.}" + "/config")
        "-DSHIELD=${lib.concatStringsSep ";" shields}"
      ];
      dontUseCmakeConfigure = true;
      env.Zephyr_DIR = "../zephyr/share/zephyr-package/cmake";
      installPhase = ''
        mkdir $out
        cp ./build/zephyr/zmk.uf2 $out/$name.uf2
      '';
    };
  packages = rec {
    eyelash_sofle_reset = buildSofle {
      name = "eyelash_sofle_reset";
      board = "eyelash_sofle_left";
      shields = [ "settings_reset" ];
    };
    eyelash_sofle_left = buildSofle {
      board = "eyelash_sofle_left";
      shields = [ "nice_view" ];
    };
    eyelash_sofle_right = buildSofle {
      board = "eyelash_sofle_right";
      shields = [ "nice_view_custom" ];
    };
    eyelash_sofle_keymap = stdenvNoCC.mkDerivation {
      name = "eyelash_sofle_keymap";
      src = ./.;
      nativeBuildInputs = [ keymap-drawer ];
      buildPhase = ''
        keymap -c keymap-drawer/config.yaml parse -z config/eyelash_sofle.keymap > eyelash_sofle.yaml
        XDG_CACHE_HOME=$PWD/keymap-drawer/cache keymap -c keymap-drawer/config.yaml draw -j config/eyelash_sofle.json eyelash_sofle.yaml > eyelash_sofle.svg
      '';
      installPhase = ''
        mkdir _p $out
        cp eyelash_sofle.svg $out
      '';
    };
    default = symlinkJoin {
      inherit (source) pname version;
      paths = [
        eyelash_sofle_reset
        eyelash_sofle_left
        eyelash_sofle_right
        eyelash_sofle_keymap
      ];
    };
  };
in
packages.default
