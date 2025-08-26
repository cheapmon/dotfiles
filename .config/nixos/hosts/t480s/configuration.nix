{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ../../modules/defaults.nix
  ];

  system.stateVersion = "23.11";

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "t480s";

  environment.sessionVariables = rec {
    MONITOR = "eDP-1";
    MONITOR_LEFT = "";
    MONITOR_RIGHT = "";

    WORK = "";
  };
}
