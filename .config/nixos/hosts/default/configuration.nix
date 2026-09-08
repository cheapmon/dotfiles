{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    /etc/nixos/hardware-configuration.nix
    (inputs.import-tree ../../modules/defaults)
    (inputs.import-tree ../../modules/extras)
  ];

  system.stateVersion = "23.11";

  networking.hostName = "default";
}
