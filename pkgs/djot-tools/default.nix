{
  fetchFromGitHub,
  rustPlatform,
}:
rustPlatform.buildRustPackage (finalAttrs: {
  pname = "djot-tools";
  version = "0.12.0";

  src = fetchFromGitHub {
    owner = "wrvsrx";
    repo = "djot-language-server";
    tag = finalAttrs.version;
    hash = "sha256-+0082hb2qwX+nhnjFjW17exXh82OcUzLJ7MhFtnsALA=";
  };

  cargoHash = "sha256-EwSHZ6z9FdKTekY1Rxt6eI//zNsZ26sbf0VYmOSc/XM=";
})
