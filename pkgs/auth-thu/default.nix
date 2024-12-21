{
  buildGoModule,
  fetchFromGitHub,
  lib,
}:
buildGoModule {
  pname = "auth-thu";
  version = "e42c2fd7f02b157538940795597d82a8b8802ca8";
  src = fetchFromGitHub {
    owner = "z4yx";
    repo = "GoAuthing";
    rev = "e42c2fd7f02b157538940795597d82a8b8802ca8";
    fetchSubmodules = false;
    sha256 = "sha256-D5WhTAZTsYXK3k0dtrC9xFDEY7R8p5LTM1mj68H2/0A=";
  };
  vendorHash = "sha256-GRviH+w9WjjuvE0078NU4b9Hf/ZqBaQ9BxiWXeiGeWU=";
  subPackages = [ "cli" ];
  postInstall = "mv $out/bin/cli $out/bin/$pname";
  meta = with lib; {
    description = "Authentication utility for srun4000 (auth.tsinghua.edu.cn / net.tsinghua.edu.cn / Tsinghua-IPv4)";
    homepage = "https://github.com/z4yx/GoAuthing";
    license = licenses.gpl3Only;
  };
}
