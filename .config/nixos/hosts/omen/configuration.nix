{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ../../modules/defaults.nix
    ../../modules/work.nix
  ];

  system.stateVersion = "23.11";

  boot.loader.grub = {
    enable = true;
    device = "nodev";
    useOSProber = true;
    efiSupport = true;
    default = "saved";
  };
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "omen";

  environment.sessionVariables = rec {
    MONITOR = "";
    MONITOR_LEFT = "HDMI-A-1";
    MONITOR_RIGHT = "DP-1";

    WORK = "yes";
  };
}
