{
  config,
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    (inputs.import-tree ../../modules/defaults)
    (inputs.import-tree ../../modules/extras)
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
    powerManagement.enable = true;
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
