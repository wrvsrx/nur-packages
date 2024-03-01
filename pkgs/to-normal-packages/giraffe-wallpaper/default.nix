{ width ? 3840
, height ? 2160
, callPackage
, source
}:
(callPackage source.src { inherit width height; }).overrideAttrs { name = "${source.pname}-${source.version}"; }
