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
  coc-zk = callIFD rec {
    inherit callPackage;
    source = sources.coc-zk;
    version = "0-unstable-" + source.date;
  };
  coc-markdown = callIFD rec {
    inherit callPackage;
    source = sources.coc-markdown;
    version = "0-unstable-" + source.date;
  };
}
