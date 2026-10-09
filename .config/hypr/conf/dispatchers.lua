-- Wrappers around layout-specific (hy3) dispatchers, falling back to the
-- default Hyprland dispatchers when the active workspace isn't using hy3
local hy3 = hl.plugin.hy3

local M = {}

local function is_hy3()
  local ws = hl.get_active_workspace()
  return ws ~= nil and ws.tiled_layout == "hy3"
end

-- Build a dispatcher that picks between hy3 and the fallback at dispatch time,
-- since the layout can differ per workspace. A nil fallback does nothing.
local function by_layout(build_hy3, fallback)
  local hy3_dsp = hy3 and build_hy3()
  return function()
    if hy3_dsp and is_hy3() then
      hl.dispatch(hy3_dsp)
    elseif fallback then
      hl.dispatch(fallback)
    end
  end
end

function M.move_focus(direction)
  return by_layout(
    function() return hy3.move_focus(direction) end,
    hl.dsp.focus({ direction = direction })
  )
end

function M.move_window(direction)
  return by_layout(
    function() return hy3.move_window(direction) end,
    hl.dsp.window.move({ direction = direction })
  )
end

function M.move_to_workspace(workspace, opts)
  -- hy3 doesn't follow by default, Hyprland does
  local follow = opts ~= nil and opts.follow == true
  return by_layout(
    function() return hy3.move_to_workspace(workspace, opts) end,
    hl.dsp.window.move({ workspace = workspace, follow = follow })
  )
end

-- No tree to walk without hy3, so raise/lower have no fallback
function M.change_focus(target)
  return by_layout(function() return hy3.change_focus(target) end, nil)
end

-- Only tabbing has a counterpart (Hyprland groups), h/v have no fallback
function M.change_group(group)
  return by_layout(
    function() return hy3.change_group(group) end,
    group == "toggletab" and hl.dsp.group.toggle() or nil
  )
end

function M.make_group(group, opts)
  return by_layout(
    function() return hy3.make_group(group, opts) end,
    group == "tab" and hl.dsp.group.toggle() or nil
  )
end

return M
