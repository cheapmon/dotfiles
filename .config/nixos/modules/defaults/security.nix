{
  config,
  pkgs,
  inputs,
  ...
}: {
  security.rtkit.enable = true;
  security.sudo = {
    enable = true;
    extraConfig = ''
      Defaults insults
    '';
  };
  security.pam.services.i3lock.enable = true;
}
