{ pkgs, to-sources }:
final: prev:
let
  sources = to-sources { inherit pkgs; };
  callIFD = import ../callIFD.nix;
  inherit (pkgs) callPackage;
  inherit (pkgs.vimUtils) buildVimPlugin;
in
{
  nvim-numbertoggle = buildVimPlugin {
    inherit (sources.nvim-numbertoggle) pname version src;
    meta.homepage = "https://github.com/sitiom/nvim-numbertoggle";
  };
  linediff-vim = buildVimPlugin {
    inherit (sources.linediff-vim) pname version src;
    meta.homepage = "https://github.com/AndrewRadev/linediff.vim";
  };
  coc-zk = callIFD {
    inherit callPackage;
    source = sources.coc-zk;
  };
  coc-markdown = callIFD {
    inherit callPackage;
    source = sources.coc-markdown;
  };
}
