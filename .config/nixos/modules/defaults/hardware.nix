{
  config,
  pkgs,
  inputs,
  ...
}: {
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };
  hardware.opengl = {
    enable = true;
    driSupport32Bit = true;
  };
}
