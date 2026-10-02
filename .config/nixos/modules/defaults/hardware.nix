{...}: {
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
  # Installs solaar and its udev rules (hidraw access for the receiver).
  programs.solaar.enable = true;
}
