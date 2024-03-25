{
  vdirsyncer,
  setuptools_scm,
  source,
}:
vdirsyncer.overridePythonAttrs (old: rec {
  version = "0.19.2-alpha";
  inherit (source) src;
  nativeBuildInputs = (old.nativeBuildInputs or [ ]) ++ [ setuptools_scm ];
  SETUPTOOLS_SCM_PRETEND_VERSION = version;
})
