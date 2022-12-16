{ xdg-utils, fetchFromGitLab }:
xdg-utils.overrideAttrs (finalAttrs: prevAttrs: {
  src = fetchFromGitLab {
    domain = "gitlab.freedesktop.org";
    owner = "xdg";
    repo = "xdg-utils";
    rev = "8ae02631a9806da11b34cd6b274af02d28aee5da";
    sha256 = "04sg199026mmanax1w457f2gvl76c9q1dxxdrcki2vfq4c1fgnar";
  };
  patches = [ ./patch_xdg_open.patch ];
})
