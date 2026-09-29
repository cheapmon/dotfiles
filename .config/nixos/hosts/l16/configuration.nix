{...}: {
  imports = [
    ./hardware-configuration.nix
  ];

  system.stateVersion = "23.11";

  networking.hostName = "l16";

  boot.loader.grub.useOSProber = true;

  environment.sessionVariables = {
    MONITOR = "eDP-1";
    MONITOR_LEFT = "";
    MONITOR_RIGHT = "";
  };
}
