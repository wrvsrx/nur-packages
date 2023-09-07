{ writeScriptBin
, trime-data
, rsync
}:
writeScriptBin "copy-trime-data-to" ''
  ${rsync}/bin/rsync --chmod=D755,F644 -avzP ${trime-data}/share/trime-data/ $1
''
