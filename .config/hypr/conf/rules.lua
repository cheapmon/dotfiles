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
hl.window_rule({ match = { class = "thunderbird" }, workspace = "7" })
hl.window_rule({ match = { class = "slack" }, workspace = "8" })
hl.window_rule({ match = { class = "element" }, workspace = "9" })
hl.window_rule({ match = { class = "signal" }, workspace = "9" })
hl.window_rule({ match = { class = "spotify" }, workspace = "10" })
