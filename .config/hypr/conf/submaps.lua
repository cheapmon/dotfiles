local colors = require("conf.colors")
local border, red, maroon = colors.border, colors.red, colors.maroon
local peach, yellow, sapphire, blue = colors.peach, colors.yellow, colors.sapphire, colors.blue

local hy3 = hl.plugin.hy3
local mainMod = "SUPER" -- keep in sync with conf/binds.lua

-- Submap colors
local cols = {
  default = { active_border = border },
  hypr    = { active_border = { colors = { red, maroon }, angle = 45 } },
  move    = { active_border = { colors = { peach, yellow }, angle = 45 } },
  resize  = { active_border = { colors = { peach, yellow }, angle = 45 } },
  focus   = { active_border = { colors = { sapphire, blue }, angle = 45 } },
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
  hl.bind("F", hl.dsp.submap("focus"))

  hl.bind("H", dispatch_and_reset(hy3.change_group("h")))
  hl.bind("V", dispatch_and_reset(hy3.change_group("v")))
  hl.bind("T", dispatch_and_reset(hy3.change_group("toggletab")))

  hl.bind("SHIFT + H", dispatch_and_reset(hy3.make_group("h", { toggle = true, ephemeral = "force" })))
  hl.bind("SHIFT + V", dispatch_and_reset(hy3.make_group("v", { toggle = true, ephemeral = "force" })))
  hl.bind("SHIFT + T", dispatch_and_reset(hy3.make_group("tab", { toggle = true, ephemeral = "force" })))

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
  hl.bind("H", hl.dsp.window.resize({ x = -step, y = 0, relative = true }), { repeating = true })
  hl.bind("J", hl.dsp.window.resize({ x = 0, y = step, relative = true }), { repeating = true })
  hl.bind("K", hl.dsp.window.resize({ x = 0, y = -step, relative = true }), { repeating = true })
  hl.bind("L", hl.dsp.window.resize({ x = step, y = 0, relative = true }), { repeating = true })

  hl.bind("Escape", hl.dsp.submap("reset"))
  hl.bind("catchall", function() end)
end)

hl.define_submap("focus", function()
  hl.bind("H", hy3.change_focus("lower"))
  hl.bind("J", hy3.change_focus("lower"))
  hl.bind("K", hy3.change_focus("raise"))
  hl.bind("L", hy3.change_focus("raise"))

  hl.bind("Escape", hl.dsp.submap("reset"))
  hl.bind("catchall", function() end)
end)
