{ buildGoModule, fetchFromGitHub, lib, source }:
buildGoModule rec {
  inherit (source) pname version src;
  vendorSha256 = "sha256-LSGyy4i4JWopX54wWXZwEtRQfijCgA618FeQErwdy8o=";
  subPackages = [ "cli" ];
  postInstall = ''
    mv $out/bin/cli $out/bin/$pname
  '';
  meta = with lib; {
    description =
      "Authentication utility for srun4000 (auth.tsinghua.edu.cn / net.tsinghua.edu.cn / Tsinghua-IPv4)";
    homepage = "https://github.com/z4yx/GoAuthing";
    license = licenses.gpl3Only;
  };
}
