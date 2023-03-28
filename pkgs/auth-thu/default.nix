{ buildGoModule, fetchFromGitHub, lib }:
buildGoModule {
  pname = "auth-thu";
  version = "dev";
  src = fetchFromGitHub ({
    owner = "z4yx";
    repo = "GoAuthing";
    rev = "8247b3a47ca5fd4ed30fe0b50d3d3db6b4b96c37";
    fetchSubmodules = false;
    sha256 = "sha256-aIa2OfoXmbikWpMzEqD3fNLAynp7wA+3qhwQSnRe8DE=";
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
