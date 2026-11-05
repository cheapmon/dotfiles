{...}: {
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    theme = "catppuccin-mocha-sapphire";
  };
  services.desktopManager.gnome.enable = true;
  services.displayManager.defaultSession = "hyprland-uwsm";

  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
    };
  };
  services.blueman.enable = true;
  services.printing.enable = true;
  services.gvfs.enable = true;
  services.gnome.gnome-keyring.enable = true;
  services.tailscale.enable = true;

  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  services.keyd = {
    enable = true;
    keyboards = {
      default = {
        ids = ["*"];
        settings = {
          main = {
            capslock = "overload(meta, backspace)";
          };
        };
      };
    };
  };
}
