{ callPackage
, source
, src ? source.src
, pname ? source.pname
, version ? source.version
, otherArgs ? { }
}:
(callPackage src otherArgs).overrideAttrs {
  name = "${pname}-${version}";
  inherit pname version;
}
