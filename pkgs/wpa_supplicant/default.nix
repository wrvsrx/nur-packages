{ wpa_supplicant }:
wpa_supplicant.overrideAttrs (finalAttrs: prevAttrs: {
  patches = prevAttrs.patches ++ [ ./tls_v1_0.patch ];
})
