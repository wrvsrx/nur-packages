{ stdenv
, cmake
, source
, sfun
, lib
, seal_lake
}:
stdenv.mkDerivation {
  inherit (source) pname src;
  version = lib.removePrefix "v" source.version;
  patches = [ ./seal.patch ];
  prePatch = ''
    mkdir -p include/cmdlime/detail
    cp --no-preserve=mode,ownership -r ${sfun}/include/sfun include/cmdlime/detail/external
    find include/cmdlime/detail/external -name '*.h' | xargs -d '\n' sed -i 's/namespace sfun/namepace cmdlime::sfun/g'
  '';
  buildInputs = [ seal_lake ];
  nativeBuildInputs = [ cmake ];
}
