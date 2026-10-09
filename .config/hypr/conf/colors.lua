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

local M         = {
  rosewater = rosewater,
  flamingo  = flamingo,
  pink      = pink,
  mauve     = mauve,
  red       = red,
  maroon    = maroon,
  peach     = peach,
  yellow    = yellow,
  green     = green,
  teal      = teal,
  sky       = sky,
  sapphire  = sapphire,
  blue      = blue,
  lavender  = lavender,
  text      = text,
}

-- Replace the alpha channel of an "rgba(rrggbbaa)" color, e.g. alpha(blue, "40")
function M.alpha(color, aa)
  return string.sub(color, 1, -4) .. aa .. ")"
end

-- Default active border, also restored when leaving a submap
M.border = { colors = { green, teal }, angle = 45 }

return M
