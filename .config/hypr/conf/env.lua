-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_THEME", "rose-pine-hyprcursor")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("PATH", os.getenv("HOME") .. "/bin:" .. os.getenv("PATH"))
