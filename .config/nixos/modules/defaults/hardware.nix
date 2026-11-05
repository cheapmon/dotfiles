{...}: {
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
  # udev rules for flashing and live training of ZSA keyboards.
  hardware.keyboard.zsa.enable = true;
  # Installs solaar and its udev rules (hidraw access for the receiver).
  programs.solaar.enable = true;
}
