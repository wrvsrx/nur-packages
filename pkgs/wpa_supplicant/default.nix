{ wpa_supplicant }:
wpa_supplicant.overrideAttrs (old: {
  # reference:
  # https://bugs.launchpad.net/ubuntu/+source/wpa/+bug/1958267
  # http://launchpadlibrarian.net/605188576/wpa_2%3A2.10-6ubuntu1_2%3A2.10-6ubuntu2.diff.gz
  patches = old.patches ++ [ ./tls_v1_0.patch ];
})
