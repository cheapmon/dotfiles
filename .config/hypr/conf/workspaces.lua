local monitors = require("conf.monitors")
local monitorLeft, monitorRight = monitors.left, monitors.right

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
