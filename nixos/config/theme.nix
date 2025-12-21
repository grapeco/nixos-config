{ lib, config, ... }:
let
  floatToHex = n: lib.trivial.toHexString (builtins.floor (n * 255));
in
with lib;
{
  options.theming = {
    opacity = mkOption {
      type = types.float;
      default = 0.8;
    };
    opacity-hex = mkOption {
      type = types.str;
      default = floatToHex config.theming.opacity;
    };
  };
}
