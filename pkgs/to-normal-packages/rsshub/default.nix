{ pkgs
, system
}:
let
  nodePackages = import ./node2nix-generated {
    inherit pkgs system;
    inherit (pkgs) nodejs;
  };
in
nodePackages.rsshub.override {
  nativeBuildInputs = [ pkgs.pkg-config ];
  buildInputs = with pkgs; [
    pango
    cairo
    pixman
  ];
  PUPPETEER_SKIP_DOWNLOAD = 1;
}
