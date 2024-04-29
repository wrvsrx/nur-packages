{
  buildGoModule,
  lib,
  source,
}:
buildGoModule {
  inherit (source) pname src version;
  vendorHash = "sha256-GRviH+w9WjjuvE0078NU4b9Hf/ZqBaQ9BxiWXeiGeWU=";
  subPackages = [ "cli" ];
  postInstall = "mv $out/bin/cli $out/bin/$pname";
  meta = with lib; {
    description = "Authentication utility for srun4000 (auth.tsinghua.edu.cn / net.tsinghua.edu.cn / Tsinghua-IPv4)";
    homepage = "https://github.com/z4yx/GoAuthing";
    license = licenses.gpl3Only;
  };
}
