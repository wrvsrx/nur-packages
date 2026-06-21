{
  fetchFromGitHub,
  rustPlatform,
}:
rustPlatform.buildRustPackage (finalAttrs: {
  pname = "djot-tools";
  version = "0.8.0";

  src = fetchFromGitHub {
    owner = "wrvsrx";
    repo = "djot-language-server";
    tag = finalAttrs.version;
    hash = "sha256-dU+RgdO5x8OwGcJKStdE+vOOW6PILGH6yNzRwgnbvwQ=";
  };

  cargoHash = "sha256-8tVSurLdWZN4EJ0kOuZOT/PkFX6nJWs4dYFUwlZ5xb8=";
})
