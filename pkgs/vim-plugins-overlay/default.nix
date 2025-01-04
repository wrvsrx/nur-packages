{
  sources,
  callIFD,
  callPackage,
  buildVimPlugin,
}:
final: prev:
let
  callIFD = import ../callIFD.nix;
in
{
  coc-zk = callIFD {
    inherit callPackage;
    source = sources.coc-zk;
  };
  coc-markdown = callIFD {
    inherit callPackage;
    source = sources.coc-markdown;
  };
}
