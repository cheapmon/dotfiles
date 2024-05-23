{
  config,
  pkgs,
  inputs,
  ...
}: {
  services.xserver = {
    enable = true;

    xkb = {
      layout = "us";
      variant = "altgr-intl";
    };

    desktopManager.xterm.enable = false;

    displayManager = {
      lightdm = {
        enable = true;

        greeters.gtk = {
          enable = true;
          theme.name = "Adwaita-dark";

          iconTheme.name = "Paper";
          iconTheme.package = pkgs.paper-icon-theme;

          cursorTheme.name = "Paper";
          cursorTheme.package = pkgs.paper-icon-theme;
        };
      };
    };

    windowManager.i3.enable = true;
  };

  services.displayManager.defaultSession = "none+i3";
  services.picom.enable = true;
  services.openssh.enable = true;
  services.blueman.enable = true;
  services.printing.enable = true;

  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };
}
