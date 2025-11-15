{
  config,
  pkgs,
  inputs,
  lib,
  ...
}: {
  virtualisation.docker = {
    enable = true;
  };

  virtualisation.virtualbox.host.enable = true;

  systemd.services."network-addresses-vboxnet0" = lib.mkIf (config.virtualisation.virtualbox.host.enable or false) {
    after = ["vboxnet0.service"];
    requires = ["vboxnet0.service"];
  };
}
