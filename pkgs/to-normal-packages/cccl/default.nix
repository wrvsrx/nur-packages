{
  cudaPackages,
  cmake,
  python3,
  stdenv,
  source,
}:
stdenv.mkDerivation {
  inherit (source) pname version src;
  nativeBuildInputs = [
    cmake
    python3
    cudaPackages.cuda_nvcc
  ];
  buildInputs = [ cudaPackages.cuda_cudart ];
  cmakeFlags = [
    "-DCCCL_ENABLE_TESTING=OFF"
    "-DCCCL_ENABLE_EXAMPLES=OFF"

    "-DLIBCUDACXX_ENABLE_LIBCUDACXX_TESTS=OFF"

    "-DCUB_ENABLE_HEADER_TESTING=OFF"
    "-DCUB_ENABLE_TESTING=OFF"
    "-DCUB_ENABLE_EXAMPLES=OFF"

    "-DTHRUST_ENABLE_HEADER_TESTING=OFF"
    "-DTHRUST_ENABLE_TESTING=OFF"
    "-DTHRUST_ENABLE_EXAMPLES=OFF"
  ];
}
