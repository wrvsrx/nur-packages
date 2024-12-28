# TODO: remove patches other than ./remove_root_need.patch after https://github.com/NixOS/nixpkgs/pull/368612 is merged
{
  pam_ssh_agent_auth,
  autoreconfHook,
  fetchDebianPatch,
}:
pam_ssh_agent_auth.overrideAttrs (old: {
  nativeBuildInputs = (old.nativeBuildInputs or [ ]) ++ [
    autoreconfHook
  ];
  patches =
    (old.patches or [ ])
    ++ (
      let
        fetchDebianPatch' =
          args:
          fetchDebianPatch (
            {
              pname = "pam-ssh-agent-auth";
              version = "0.10.3";
              debianRevision = "11";
            }
            // args
          );
      in
      [
        # Patch configure to remove implicit function declaration errors under gcc14
        # Requires autoreconfHook
        (fetchDebianPatch' {
          patch = "fix-configure.patch";
          hash = "sha256-ymXv2o/NpFeVQ6r0hvJEeMpvs5Ht9jq4RSw8ssv43FY=";
        })

        # Avoided incompatible pointer passing to fix GCC 14 build errors. Add missing 'const', cast to expected pointer type (DSA_SIG) and avoid
        # pointer to pointer when pointer is required.
        (fetchDebianPatch' {
          patch = "1000-gcc-14.patch";
          hash = "sha256-EvdaIhrfKZ1mB7qvNiGx/hYdthStgnhK7xvJEhhAFDQ=";
        })

        # remove need of root
        ./remove_root_need.patch
      ]
    );
})
