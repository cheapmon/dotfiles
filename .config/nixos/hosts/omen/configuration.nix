{config, ...}: {
  imports = [
    ./hardware-configuration.nix
  ];

  system.stateVersion = "23.11";

  networking.hostName = "omen";

  boot.loader.grub.useOSProber = true;

  services.xserver.videoDrivers = ["nvidia"];
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = true;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  environment.sessionVariables = {
    MONITOR = "";
    MONITOR_LEFT = "HDMI-A-1";
    MONITOR_RIGHT = "DP-1";
    LIBVA_DRIVER_NAME = "nvidia";
    GBM_BACKEND = "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
  };
}
