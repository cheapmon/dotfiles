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
}
