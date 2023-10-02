{ pkgs, to-sources }:
let
  sources = to-sources { inherit pkgs; };
  inherit (pkgs.vimUtils) buildVimPlugin;
  inherit (pkgs) callPackage;
in
{
  nvim-numbertoggle = buildVimPlugin {
    inherit (sources.nvim-numbertoggle) pname version src;
    meta.homepage = "https://github.com/sitiom/nvim-numbertoggle";
  };
  coc-zk = callPackage ./coc-zk { source = sources.coc-zk; };
}
