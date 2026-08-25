{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
  ];

  system.stateVersion = "23.11";

  boot.loader.grub = {
    enable = true;
    device = "nodev";
    useOSProber = true;
    efiSupport = true;
    default = "saved";
    configurationLimit = 2;
  };
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "omen";

  services.xserver.videoDrivers = ["nvidia"];
  hardware.nvidia = {
    modesetting.enable = true;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  environment.sessionVariables = rec {
    MONITOR = "";
    MONITOR_LEFT = "HDMI-A-1";
    MONITOR_RIGHT = "DP-1";
  };
}
