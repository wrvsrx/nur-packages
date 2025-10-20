{ makeSetupHook }:

{
  lakeSetupHook = makeSetupHook {
    name = "lake-setup-hook.sh";
    substitutions = { };
  } ./lake-setup-hook.sh;
}
