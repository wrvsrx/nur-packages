{
  php,
  fetchpatch,
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
  patches = [
    (fetchpatch {
      url = "https://github.com/wrvsrx/Baikal/compare/2160c1dd9c05fa3d83f34ce9daba0a0346161af2...1907ac44822a2e3a3700d9bb324a295fc57530f7.patch";
      hash = "sha256-6QCOp9JFelnifZ6U3r2Kd1g5QsVpjc+BuCHkYkrvydM=";
    })
  ];
  vendorHash = "sha256-R9DlgrULUJ02wBOGIdOQrcKiATSSZ/UApYODQ8485Qs=";
}
