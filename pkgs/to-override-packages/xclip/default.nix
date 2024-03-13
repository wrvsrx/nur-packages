{ xclip, source }:
# To fix https://github.com/astrand/xclip/issues/131
xclip.overrideAttrs (old: { inherit (source) version src; })
