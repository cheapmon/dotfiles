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

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "t14s";

  environment.sessionVariables = rec {
    MONITOR = "eDP-1";
    MONITOR_LEFT = "HDMI-A-1";
    MONITOR_RIGHT = "DP-7";

    WORK = "yes";
  };
}
