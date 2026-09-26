-- Catppuccin Mocha
local rosewater = "rgba(f5e0dcff)"
local flamingo  = "rgba(f2cdcdff)"
local pink      = "rgba(f5c2e7ff)"
local mauve     = "rgba(cba6f7ff)"
local red       = "rgba(f38ba8ff)"
local maroon    = "rgba(eba0acff)"
local peach     = "rgba(fab387ff)"
local yellow    = "rgba(f9e2afff)"
local green     = "rgba(a6e3a1ff)"
local teal      = "rgba(94e2d5ff)"
local sky       = "rgba(89dcebff)"
local sapphire  = "rgba(74c7ecff)"
local blue      = "rgba(89b4faff)"
local lavender  = "rgba(b4befeff)"
local text      = "rgba(cdd6f4ff)"

-- Plugins
hl.plugin.load(os.getenv("HY3_PLUGIN"))

local hy3 = hl.plugin.hy3

hl.config({
  plugin = {
    hy3 = {
      tabs = {
        height = 32,
        border_width = 3,

        text_font = "IosevkaTerm Nerd Font",
        text_height = 11,
        text_padding = 11,

        colors = {
          active        = string.sub(blue, 1, -4) .. "40)",
          active_border = sapphire,
          active_text   = text,
        },
      }
    }
  }
})


-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
-- NOTE: Set MONITOR_LEFT, MONITOR_RIGHT and MONITOR as environment variables,
-- or replace the os.getenv() calls below with your monitor names.
local monitorLeft  = os.getenv("MONITOR_LEFT")  or "DP-1"
local monitorRight = os.getenv("MONITOR_RIGHT") or "DP-2"
local monitor      = os.getenv("MONITOR")       or "eDP-1"

hl.monitor({ output = monitorLeft,  mode = "preferred", position = "auto-left",  scale = 1 })
hl.monitor({ output = monitorRight, mode = "preferred", position = "auto-right", scale = 1 })
hl.monitor({ output = monitor,      mode = "preferred", position = "auto",       scale = 1 })

-- Autostart
hl.on("hyprland.start", function()
    hl.exec_cmd("/bin/sh -c 'systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP HYPRLAND_INSTANCE_SIGNATURE; dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP HYPRLAND_INSTANCE_SIGNATURE; systemctl --user start hyprland-session.target'")
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

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_THEME", "rose-pine-hyprcursor")
hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("GBM_BACKEND", "nvidia-drm")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("PATH", os.getenv("HOME") .. "/bin:" .. os.getenv("PATH"))

-- https://wiki.hypr.land/Configuring/Variables/#general
hl.config({
    general = {
        gaps_in = 5,
        gaps_out = 15,

        border_size = 3,

        -- https://wiki.hypr.land/Configuring/Variables/#variable-types
        col = {
            active_border   = { colors = { green, teal }, angle = 45 },
            inactive_border = text,
        },

        layout = "hy3",
    },
})

-- https://wiki.hypr.land/Configuring/Variables/#decoration
hl.config({
    decoration = {
        rounding = 6,
        rounding_power = 2,

        active_opacity = 1.0,
        inactive_opacity = 1.0,

        shadow = {
            enabled = true,
            range = 4,
            render_power = 3,
            color = "rgba(1a1a1aee)",
        },

        -- https://wiki.hypr.land/Configuring/Variables/#blur
        blur = {
            enabled = true,
            size = 3,
            passes = 3,

            vibrancy = 0.1696,
        },
    },
})

hl.config({
    misc = {
        disable_hyprland_logo = true,
        disable_splash_rendering = true,
    },
})

-- https://wiki.hypr.land/Configuring/Variables/#animations
hl.config({
    animations = {
        enabled = true,
    },
})

hl.curve("easeOutQuint",   { type = "bezier", points = { {0.23, 1},    {0.32, 1} } })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1} } })
hl.curve("linear",         { type = "bezier", points = { {0, 0},       {1, 1}    } })
hl.curve("almostLinear",   { type = "bezier", points = { {0.5, 0.5},   {0.75, 1} } })
hl.curve("quick",          { type = "bezier", points = { {0.15, 0},    {0.1, 1}  } })

hl.animation({ leaf = "global",        enabled = true, speed = 10,   bezier = "default" })
hl.animation({ leaf = "border",        enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows",       enabled = true, speed = 4.79, bezier = "easeOutQuint" })
hl.animation({ leaf = "windowsIn",     enabled = true, speed = 4.1,  bezier = "easeOutQuint", style = "popin 87%" })
hl.animation({ leaf = "windowsOut",    enabled = true, speed = 1.49, bezier = "linear",       style = "popin 87%" })
hl.animation({ leaf = "fadeIn",        enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut",       enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade",          enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers",        enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn",      enabled = true, speed = 4,    bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut",     enabled = true, speed = 1.5,  bezier = "linear",       style = "fade" })
hl.animation({ leaf = "fadeLayersIn",  enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces",    enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn",  enabled = true, speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })

-- See https://wiki.hypr.land/Configuring/Layouts/Dwindle-Layout/
hl.config({
    dwindle = {
        preserve_split = true,
    },
})

-- See https://wiki.hypr.land/Configuring/Layouts/Master-Layout/
hl.config({
    master = {
        new_status = "slave",
    },
})

-- https://wiki.hypr.land/Configuring/Variables/#input
hl.config({
    input = {
        kb_layout = "us",
        kb_variant = "altgr-intl",
        kb_options = "nodeadkeys",

        repeat_rate = 35,
        repeat_delay = 200,

        touchpad = {
            natural_scroll = true,
        },
    },
})

-- Workspaces
hl.workspace_rule({ workspace = "1", monitor = monitorLeft })
hl.workspace_rule({ workspace = "2", monitor = monitorLeft })
hl.workspace_rule({ workspace = "3", monitor = monitorLeft })
hl.workspace_rule({ workspace = "4", monitor = monitorLeft })
hl.workspace_rule({ workspace = "5", monitor = monitorLeft })
hl.workspace_rule({ workspace = "6", monitor = monitorRight })
hl.workspace_rule({ workspace = "7", monitor = monitorRight })
hl.workspace_rule({ workspace = "8", monitor = monitorRight })
hl.workspace_rule({ workspace = "9", monitor = monitorRight })
hl.workspace_rule({ workspace = "10", monitor = monitorRight })

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
hl.bind(mainMod .. " + S", hl.dsp.exec_cmd("systemctl poweroff"))
hl.bind(mainMod .. " + A", hl.dsp.exec_cmd("systemctl reboot"))
hl.bind(mainMod .. " + E", hl.dsp.exit())
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd("hyprctl reload"))

hl.bind(mainMod .. " + T", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + W", hl.dsp.window.pin())
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("hyprctl dispatch layoutmsg swapwithmaster"))

-- Move focus with mainMod + hjkl
hl.bind(mainMod .. " + H", hy3.move_focus("left"))
hl.bind(mainMod .. " + L", hy3.move_focus("right"))
hl.bind(mainMod .. " + K", hy3.move_focus("up"))
hl.bind(mainMod .. " + J", hy3.move_focus("down"))

-- Switch workspaces with mainMod + [0-9]
for i = 1, 10 do
    local key = i % 10
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
end

-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10
    hl.bind(mainMod .. " + SHIFT + " .. key, hy3.move_to_workspace(i, { follow = true }))
end

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + Tab",       hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + SHIFT + Tab", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })

-- Spotify
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("spotifycli --next"),     { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("spotifycli --playpause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("spotifycli --playpause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("spotifycli --prev"),      { locked = true })

-- Programs
hl.bind(mainMod .. " + CTRL + R", hl.dsp.exec_cmd("refresh"))
hl.bind(mainMod .. " + CTRL + L", hl.dsp.exec_cmd("hyprlock"))
hl.bind(mainMod .. " + CTRL + Z", hl.dsp.exec_cmd("wofi-pass -t"))
hl.bind(mainMod .. " + CTRL + F", hl.dsp.exec_cmd('grim -g "$(slurp)" - | swappy -f -'))
hl.bind(mainMod .. " + CTRL + Return", hl.dsp.exec_cmd("ghostty"))

-- Submap colors
local cols = {
  default = { active_border = { colors = { green, teal   }, angle = 45 } },
  hypr    = { active_border = { colors = { red, maroon   }, angle = 45 } },
  move    = { active_border = { colors = { peach, yellow }, angle = 45 } },
  resize  = { active_border = { colors = { peach, yellow }, angle = 45 } },
}

hl.on("keybinds.submap", function(name)
  hl.config({ general = { col = cols[name] or cols["default"] } })
end)

-- Submaps
local function dispatch_and_reset(f)
  return function()
    hl.dispatch(f)
    hl.dispatch(hl.dsp.submap("reset"))
  end
end

hl.bind(mainMod .. " + Space", hl.dsp.submap("hypr"))

hl.define_submap("hypr", function()
  hl.bind("Space", dispatch_and_reset(hl.dsp.exec_cmd("wofi --show run")))

  hl.bind("M", hl.dsp.submap("move"))
  hl.bind("R", hl.dsp.submap("resize"))

  hl.bind("H", dispatch_and_reset(hy3.change_group("h")))
  hl.bind("V", dispatch_and_reset(hy3.change_group("v")))
  hl.bind("T", dispatch_and_reset(hy3.change_group("toggletab")))

  hl.bind("SHIFT + H", dispatch_and_reset(hy3.make_group("h")))
  hl.bind("SHIFT + V", dispatch_and_reset(hy3.make_group("v")))
  hl.bind("SHIFT + T", dispatch_and_reset(hy3.make_group("tab")))

  hl.bind("Escape", hl.dsp.submap("reset"))
  hl.bind("catchall", function() end)
end)

hl.define_submap("move", function()
  hl.bind("H", hy3.move_window("left"))
  hl.bind("J", hy3.move_window("down"))
  hl.bind("K", hy3.move_window("up"))
  hl.bind("L", hy3.move_window("right"))

  hl.bind("Escape", hl.dsp.submap("reset"))
  hl.bind("catchall", function() end)
end)

hl.define_submap("resize", function()
  local step = 20
  hl.bind("H", hl.dsp.window.resize({ x = -step, y =     0, relative = true }), { repeating = true })
  hl.bind("J", hl.dsp.window.resize({ x =     0, y =  step, relative = true }), { repeating = true })
  hl.bind("K", hl.dsp.window.resize({ x =     0, y = -step, relative = true }), { repeating = true })
  hl.bind("L", hl.dsp.window.resize({ x =  step, y =     0, relative = true }), { repeating = true })

  hl.bind("Escape", hl.dsp.submap("reset"))
  hl.bind("catchall", function() end)
end)

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- See https://wiki.hypr.land/Configuring/Workspace-Rules/

-- Ignore maximize requests from all apps. You'll probably like this.
hl.window_rule({
    name = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})

-- Fix some dragging issues with XWayland
hl.window_rule({
    name = "fix-xwayland-drags",
    match = {
        class = "^$",
        title = "^$",
        xwayland = true,
        float = true,
        fullscreen = false,
        pin = false,
    },

    no_focus = true,
})

hl.window_rule({ match = { class = "firefox-devedition" }, workspace = "6" })
hl.window_rule({ match = { class = "thunderbird" },       workspace = "7" })
hl.window_rule({ match = { class = "slack" },             workspace = "8" })
hl.window_rule({ match = { class = "element" },           workspace = "9" })
hl.window_rule({ match = { class = "signal" },            workspace = "9" })
hl.window_rule({ match = { class = "spotify" },           workspace = "10" })

-- Require extra configuration files
local lfs = require("lfs")
for file in lfs.dir(os.getenv("HOME") .. "/.config/hypr/extras") do
  if file:match("%.lua$") then
    require("extras." .. file:sub(1, -5))
  end
end
