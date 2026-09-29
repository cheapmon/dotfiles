{...}: {
  imports = [
    /etc/nixos/hardware-configuration.nix
  ];

  system.stateVersion = "23.11";

  networking.hostName = "default";
}
