{ wpa_supplicant }:
wpa_supplicant.overrideAttrs (old: {
  patches = old.patches ++ [ ./tls_v1_0.patch ];
})
