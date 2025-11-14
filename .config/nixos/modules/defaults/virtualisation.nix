{
  config,
  pkgs,
  inputs,
  ...
}: {
  virtualisation.docker = {
    enable = true;
  };

  virtualisation.virtualbox.host.enable = true;
}
