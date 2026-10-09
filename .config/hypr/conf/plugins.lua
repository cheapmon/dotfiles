local colors = require("conf.colors")
local alpha, blue, sapphire, text = colors.alpha, colors.blue, colors.sapphire, colors.text

-- Plugins
hl.plugin.load(os.getenv("HY3_PLUGIN"))

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
          active        = alpha(blue, "40"),
          active_border = sapphire,
          active_text   = text,
        },
      }
    }
  }
})
