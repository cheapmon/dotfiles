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

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "t480s";

  environment.sessionVariables = rec {
    MONITOR = "eDP-1";
    MONITOR_LEFT = "";
    MONITOR_RIGHT = "";
  };
}
