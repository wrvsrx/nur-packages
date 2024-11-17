{ rustdesk-flutter, lib }:
rustdesk-flutter.override (old: {
  flutter319 = old.flutter319 // {
    buildFlutterApplication =
      x:
      old.flutter319.buildFlutterApplication (
        x
        // {
          postPatch =
            let
              ls = lib.strings.splitString "\n" x.postPatch;
              ls' = lib.lists.drop 2 ls;
              s = lib.strings.concatStringsSep "\n" ls';
            in
            ''
              if [ $cargoDepsCopy ]; then # That will be inherited to buildDartPackage and it doesn't have cargoDepsCopy
                substituteInPlace $cargoDepsCopy/libappindicator-sys-*/src/lib.rs \
                  --replace-fail "libayatana-appindicator3.so.1" "${lib.getLib old.libayatana-appindicator}/lib/libayatana-appindicator3.so.1"
              fi
            ''
            + s;
        }
      );
  };
})
