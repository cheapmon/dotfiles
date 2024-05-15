{
  config,
  pkgs,
  inputs,
  ...
}: {
  hardware.pulseaudio.enable = true;
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };
}
