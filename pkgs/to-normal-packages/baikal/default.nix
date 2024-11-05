{
  php,
  fetchFromGitHub,
}:
php.buildComposerProject {
  pname = "baikal";
  version = "0.10.0";
  src = fetchFromGitHub {
    owner = "sabre-io";
    repo = "Baikal";
    rev = "0.10.0";
    fetchSubmodules = false;
    sha256 = "sha256-7avHpkcbbXAiuOKM49oc5EtndSH0FYgHMqXGfD03R2M=";
  };
  composerLock = ./composer.lock;
  vendorHash = "sha256-/QUwkFniY7cF/AhmMTXaEIg7Z9LPNyqeGfeVPLVb5Ak=";
}
