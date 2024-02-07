{ spdlog, source }:
# To fix https://github.com/gabime/spdlog/issues/2893
spdlog.overrideAttrs (old: {
  inherit (source) version src;
  patches = [ ];
})
