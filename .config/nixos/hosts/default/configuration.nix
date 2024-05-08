{ config, pkgs, inputs, ... }:

{
  imports =
    [
      /etc/nixos/hardware-configuration.nix
      ../../modules/defaults.nix
    ];

  system.stateVersion = "23.11";

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "default";
}
