{ fcitx5-rime, runCommand }:
runCommand "rime-fcitx5" { } ''
  mkdir -p $out/share/rime-data
  cp -r ${fcitx5-rime}/share/rime-data/fcitx5.yaml $out/share/rime-data/
''
