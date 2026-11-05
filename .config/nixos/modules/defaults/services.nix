{...}: {
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    theme = "catppuccin-mocha-sapphire";
  };
  services.desktopManager.gnome.enable = true;
  services.displayManager.defaultSession = "hyprland-uwsm";

  # Route screencast/screenshot portals to the correct backend per session so
  # OBS (PipeWire ScreenCast) gets frames. Without this, the Hyprland portal
  # can hijack the ScreenCast D-Bus name in a GNOME session -> black capture.
  xdg.portal.config = {
    gnome = {
      default = ["gnome" "gtk"];
      "org.freedesktop.impl.portal.ScreenCast" = ["gnome"];
      "org.freedesktop.impl.portal.Screenshot" = ["gnome"];
    };
    hyprland = {
      default = ["hyprland" "gtk"];
      "org.freedesktop.impl.portal.ScreenCast" = ["hyprland"];
      "org.freedesktop.impl.portal.Screenshot" = ["hyprland"];
    };
  };

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
  services.pulseaudio.enable = false;
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
        extraConfig = ''
        '';
      };
    };
  };
}
