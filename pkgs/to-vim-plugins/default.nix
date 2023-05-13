{ pkgs, to-sources }:
let
  sources = to-sources { inherit pkgs; };
  inherit (pkgs.vimUtils) buildVimPluginFrom2Nix;
in
{
  nvim-numbertoggle = buildVimPluginFrom2Nix {
    inherit (sources.nvim-numbertoggle) pname version src;
    meta.homepage = "https://github.com/sitiom/nvim-numbertoggle";
  };
}
