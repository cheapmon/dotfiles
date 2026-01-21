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
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
}
