local colors = require("conf.colors")
local border = colors.border

-- https://wiki.hypr.land/Configuring/Variables/#general
hl.config({
  general = {
    gaps_in = 5,
    gaps_out = 15,

    border_size = 3,

    -- https://wiki.hypr.land/Configuring/Variables/#variable-types
    col = {
      active_border = border,
      -- inactive_border = text,
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
