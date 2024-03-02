{ buildGoModule
, fetchurl
, lib
, source
}:
buildGoModule {
  inherit (source) pname src;
  version = source.version;
  vendorHash = "sha256-GRviH+w9WjjuvE0078NU4b9Hf/ZqBaQ9BxiWXeiGeWU=";
  patches = [
    (fetchurl {
      url = "https://github.com/z4yx/GoAuthing/pull/35/commits/5692ef96394416339f507b86cef648a4d4f0937c.patch";
      hash = "sha256-qBV6gMioAu7wvyVfP9JNPXF1SLaqxblYCxRO9hLVgv8=";
    })
  ];
  subPackages = [ "cli" ];
  postInstall = "mv $out/bin/cli $out/bin/$pname";
  meta = with lib; {
    description =
      "Authentication utility for srun4000 (auth.tsinghua.edu.cn / net.tsinghua.edu.cn / Tsinghua-IPv4)";
    homepage = "https://github.com/z4yx/GoAuthing";
    license = licenses.gpl3Only;
  };
}
