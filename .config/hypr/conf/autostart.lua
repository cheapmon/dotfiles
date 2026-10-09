-- Autostart
hl.on("hyprland.start", function()
  hl.exec_cmd(
    "/bin/sh -c 'systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP HYPRLAND_INSTANCE_SIGNATURE; dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP HYPRLAND_INSTANCE_SIGNATURE; systemctl --user start hyprland-session.target'")
  hl.exec_cmd("shikane")
  hl.exec_cmd("hyprpaper")
  hl.exec_cmd("hypridle")
  hl.exec_cmd("waybar")
  hl.exec_cmd("wlsunset")
  hl.exec_cmd("nm-applet")
  hl.exec_cmd("blueman-applet")
  hl.exec_cmd("dex -a")

  hl.exec_cmd("/bin/sh -c 'pull-dotfiles && link-dotfiles'")
end)
