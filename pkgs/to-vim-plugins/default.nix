{ pkgs, to-sources }:
let
  sources = to-sources { inherit pkgs; };
  inherit (pkgs.vimUtils) buildVimPlugin;
  inherit (pkgs) callPackage;
  callIFD = import ../callIFD.nix;
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
