local wezterm = require 'wezterm'
local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.window_background_opacity = 0.8
config.color_scheme = os.getenv("VIM_COLORSCHEME")
config.enable_tab_bar = false
config.font = wezterm.font 'IosevkaTerm Nerd Font'
config.font_size = 17.0
config.window_decorations = "TITLE"
config.enable_scroll_bar = false
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}
config.scrollback_lines = 100000
config.cursor_blink_rate = 0
config.warn_about_missing_glyphs = false

return config
