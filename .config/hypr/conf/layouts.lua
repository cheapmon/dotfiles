-- See https://wiki.hypr.land/Configuring/Layouts/Dwindle-Layout/
hl.config({
  dwindle = {
    preserve_split = true,
  },
})

-- See https://wiki.hypr.land/Configuring/Layouts/Master-Layout/
hl.config({
  master = {
    new_status = "slave",
  },
})

-- See https://wiki.hypr.land/Configuring/Layouts/Scrolling-Layout/
hl.config({
  scrolling = {
    column_width = 0.75,
    explicit_column_widths = "0.25, 0.333, 0.5, 0.667, 0.75, 1.0",
  }
})
