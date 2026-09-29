{
  config,
  lib,
  ...
}: {
  virtualisation.docker = {
    enable = true;
  };

  virtualisation.virtualbox.host.enable = true;

  systemd.services."network-addresses-vboxnet0" = lib.mkIf config.virtualisation.virtualbox.host.enable {
    after = ["vboxnet0.service"];
    requires = ["vboxnet0.service"];
  };
}
