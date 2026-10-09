local dsp = require("conf.dispatchers")

-- See https://wiki.hypr.land/Configuring/Binds/
local mainMod = "SUPER"

hl.config({
  binds = {
    workspace_back_and_forth = true,
  },
})

-- Basic binds
hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd("ghostty -e zellij"))

hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("hyprctl kill"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd("systemctl poweroff"))
hl.bind(mainMod .. " + SHIFT + A", hl.dsp.exec_cmd("systemctl reboot"))
hl.bind(mainMod .. " + SHIFT + E", hl.dsp.exit())
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd("hyprctl reload"))

hl.bind(mainMod .. " + T", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + W", hl.dsp.window.pin())
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("hyprctl dispatch layoutmsg swapwithmaster"))

-- Move focus with mainMod + hjkl
hl.bind(mainMod .. " + H", dsp.move_focus("left"))
hl.bind(mainMod .. " + L", dsp.move_focus("right"))
hl.bind(mainMod .. " + K", dsp.move_focus("up"))
hl.bind(mainMod .. " + J", dsp.move_focus("down"))

-- Switch workspaces with mainMod + [0-9]
for i = 1, 10 do
  local key = i % 10
  hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
end

-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
  local key = i % 10
  hl.bind(mainMod .. " + SHIFT + " .. key, dsp.move_to_workspace(i, { follow = true }))
end

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + Tab", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + SHIFT + Tab", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
  { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
  { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
  { locked = true, repeating = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

-- Spotify
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("spotifycli --next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("spotifycli --playpause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("spotifycli --playpause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("spotifycli --prev"), { locked = true })

-- Programs
hl.bind(mainMod .. " + CTRL + R", hl.dsp.exec_cmd("refresh"))
hl.bind(mainMod .. " + CTRL + L", hl.dsp.exec_cmd("hyprlock"))
hl.bind(mainMod .. " + CTRL + Z", hl.dsp.exec_cmd("wofi-pass -t"))
hl.bind(mainMod .. " + CTRL + F", hl.dsp.exec_cmd('grim -g "$(slurp)" - | swappy -f -'))
hl.bind(mainMod .. " + CTRL + Return", hl.dsp.exec_cmd("ghostty"))
