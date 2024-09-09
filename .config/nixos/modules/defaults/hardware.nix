{
  config,
  pkgs,
  inputs,
  ...
}: {
  hardware.pulseaudio.enable = false;
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };
}
