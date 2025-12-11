{
  config,
  pkgs,
  inputs,
  ...
}: {
  networking.networkmanager.enable = true;
  networking.firewall.allowedTCPPorts = [80 443];
}
