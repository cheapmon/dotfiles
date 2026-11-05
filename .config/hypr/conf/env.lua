-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_THEME", "rose-pine-hyprcursor")
-- Prepend ~/bin once, since the config can be evaluated more than once
local home_bin = os.getenv("HOME") .. "/bin"
local path = os.getenv("PATH") or ""
if not (":" .. path .. ":"):find(":" .. home_bin .. ":", 1, true) then
  hl.env("PATH", home_bin .. ":" .. path)
end
