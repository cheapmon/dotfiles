-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
-- NOTE: Set MONITOR_LEFT, MONITOR_RIGHT and MONITOR as environment variables,
-- or replace the os.getenv() calls below with your monitor names.
local monitorLeft  = os.getenv("MONITOR_LEFT") or "DP-1"
local monitorRight = os.getenv("MONITOR_RIGHT") or "DP-2"
local monitor      = os.getenv("MONITOR") or "eDP-1"

hl.monitor({ output = monitorLeft, mode = "preferred", position = "auto-left", scale = 1 })
hl.monitor({ output = monitorRight, mode = "preferred", position = "auto-right", scale = 1 })
hl.monitor({ output = monitor, mode = "preferred", position = "auto", scale = 1 })

return { left = monitorLeft, right = monitorRight, main = monitor }
