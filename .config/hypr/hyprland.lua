require("conf.plugins")
require("conf.monitors")
require("conf.autostart")
require("conf.env")
require("conf.appearance")
require("conf.animations")
require("conf.layouts")
require("conf.input")
require("conf.workspaces")
require("conf.binds")
require("conf.submaps")
require("conf.rules")

-- Require extra configuration files
local lfs = require("lfs")
for file in lfs.dir(os.getenv("HOME") .. "/.config/hypr/extras") do
  if file:match("%.lua$") then
    require("extras." .. file:sub(1, -5))
  end
end
