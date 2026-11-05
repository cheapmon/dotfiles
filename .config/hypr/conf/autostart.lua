-- Autostart
hl.on("hyprland.start", function()
  hl.exec_cmd("uwsm finalize")
  hl.exec_cmd("shikane")
  hl.exec_cmd("hyprpaper")
  hl.exec_cmd("waybar")
  hl.exec_cmd("wlsunset")

  hl.exec_cmd("/bin/sh -c 'pull-dotfiles && link-dotfiles'")
end)
