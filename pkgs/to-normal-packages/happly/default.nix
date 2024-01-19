{ stdenv
, meson
, ninja
, source
, fetchpatch
}:
stdenv.mkDerivation {
  inherit (source) pname src version;
  patches = [
    ./pc.patch
    # fix build on nvcc
    (fetchpatch {
      url = "https://github.com/nmwsharp/happly/compare/cfa2611550bc7da65855a78af0574b65deb81766...3bf5fe46279cfabf624037668f30faf4b05720dd.patch";
      hash = "sha256-9Y5g/XzeInVg4qV1H12QsZ/OSMezXWCz2U6RfH4t/BE=";
    })
  ];
  nativeBuildInputs = [
    meson
    ninja
  ];
}

