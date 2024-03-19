{ mainline, source }:
mainline.overrideAttrs (old: {
  inherit (source) pname version src;
  meta = old.meta // {
    description = old.meta.description + " - early access branch";
  };
})
