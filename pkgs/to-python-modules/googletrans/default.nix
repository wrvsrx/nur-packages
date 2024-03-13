{
  pythonRelaxDepsHook,
  httpx,
  h2,
  googletrans,
  source,
}:

googletrans.overridePythonAttrs (
  old: {
    inherit (source) pname version src;
    propagatedBuildInputs = old.propagatedBuildInputs ++ [
      httpx
      h2
    ];
    patches = [ ./googletrans.patch ];
    nativeBuildInputs = [ pythonRelaxDepsHook ];
    pythonRelaxDeps = [ "httpx" ];
  }
)
