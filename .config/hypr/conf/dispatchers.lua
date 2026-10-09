-- Wrappers around layout-specific (hy3, scrolling) dispatchers, falling back
-- to the default Hyprland dispatchers when the active workspace uses neither
local hy3 = hl.plugin.hy3

local M = {}

local function active_layout()
  local ws = hl.get_active_workspace()
  return ws and ws.tiled_layout
end

-- Build a dispatcher that picks one per layout at dispatch time, since the
-- layout can differ per workspace. hy3 dispatchers are built lazily as the
-- plugin may not be loaded. A missing entry uses the fallback, a nil fallback
-- does nothing.
local function by_layout(layouts, fallback)
  local dsps = {
    hy3 = hy3 and layouts.hy3 and layouts.hy3(),
    scrolling = layouts.scrolling,
  }
  return function()
    local dsp = dsps[active_layout()] or fallback
    if dsp then
      hl.dispatch(dsp)
    end
  end
end

function M.move_focus(direction)
  return by_layout({
    hy3 = function() return hy3.move_focus(direction) end,
    -- Centers the view and wraps instead of jumping to the next monitor
    scrolling = hl.dsp.layout("focus " .. direction:sub(1, 1)),
  }, hl.dsp.focus({ direction = direction }))
end

-- Scrolling swaps whole columns left/right, up/down moves within the column
function M.move_window(direction)
  local swapcol = { left = "l", right = "r" }
  return by_layout({
    hy3 = function() return hy3.move_window(direction) end,
    scrolling = swapcol[direction] and hl.dsp.layout("swapcol " .. swapcol[direction]),
  }, hl.dsp.window.move({ direction = direction }))
end

-- Resize by step px, or cycle scrolling columns through the preconfigured
-- explicit_column_widths. Scrolling has no row heights, so up/down fall back.
function M.resize(direction, step)
  local x = ({ left = -step, right = step })[direction] or 0
  local y = ({ up = -step, down = step })[direction] or 0
  local colresize = { left = "-conf", right = "+conf" }
  return by_layout({
    scrolling = colresize[direction] and hl.dsp.layout("colresize " .. colresize[direction]),
  }, hl.dsp.window.resize({ x = x, y = y, relative = true }))
end

function M.move_to_workspace(workspace, opts)
  -- hy3 doesn't follow by default, Hyprland does
  local follow = opts ~= nil and opts.follow == true
  return by_layout(
    { hy3 = function() return hy3.move_to_workspace(workspace, opts) end },
    hl.dsp.window.move({ workspace = workspace, follow = follow })
  )
end

-- No tree to walk without hy3, so raise/lower have no fallback
function M.change_focus(target)
  return by_layout({ hy3 = function() return hy3.change_focus(target) end }, nil)
end

-- Only tabbing has a counterpart (Hyprland groups), h/v have no fallback
function M.change_group(group)
  return by_layout(
    { hy3 = function() return hy3.change_group(group) end },
    group == "toggletab" and hl.dsp.group.toggle() or nil
  )
end

function M.make_group(group, opts)
  return by_layout(
    { hy3 = function() return hy3.make_group(group, opts) end },
    group == "tab" and hl.dsp.group.toggle() or nil
  )
end

return M
