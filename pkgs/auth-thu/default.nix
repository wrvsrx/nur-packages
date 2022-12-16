{ buildGoModule, fetchFromGitHub, lib }:
buildGoModule rec {
  pname = "auth-thu";
  version = "v2.2.1";
  src = fetchFromGitHub ({
    owner = "z4yx";
    repo = "GoAuthing";
    rev = "8247b3a47ca5fd4ed30fe0b50d3d3db6b4b96c37";
    sha256 = "0cghbrs4l40wmavhzh3vgb5c1lkwyyh14cwkbajbi68pz8wvd1k8";
  });
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
