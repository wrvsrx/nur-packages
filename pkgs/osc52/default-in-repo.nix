{ mkDerivation, base, base64, lib, text }:
mkDerivation {
  pname = "osc52";
  version = "0.1.0.0";
  src = ./.;
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [ base base64 text ];
  homepage = "https://github.com/wrvsrx/osc52";
  license = lib.licenses.mit;
  mainProgram = "osc52";
}
