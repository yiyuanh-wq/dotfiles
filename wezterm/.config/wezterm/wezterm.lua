-- Pull in the wezterm API
local wezterm = require 'wezterm'

local sessionizer = require("sessionizer")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.audible_bell = "Disabled"
config.font = wezterm.font "MonoLisa"
config.font_size = 21

config.color_scheme = "Solarized Dark (Gogh)"

config.use_fancy_tab_bar = false
config.enable_tab_bar = false
config.tab_bar_at_bottom = true
config.window_decorations = "RESIZE"
config.force_reverse_video_cursor = true
config.debug_key_events = true

config.keys = {
  {
    key = 'c',
    mods = 'CMD',
    action = wezterm.action.CopyTo 'Clipboard',
  },
  {
    key = 'v',
    mods = 'CMD',
    action = wezterm.action.PasteFrom 'Clipboard',
  },
  {
    key = '"',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.SplitPane {
      direction = 'Left',
      size = { Percent = 50 }
    }
  },
  {
    key = '%',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.SplitPane {
      direction = 'Down',
      size = { Percent = 50 }
    }
  },
  {
    key = 'h',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.ActivatePaneDirection 'Left',
  },
  {
    key = 'l',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.ActivatePaneDirection 'Right',
  },
  {
    key = 'k',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.ActivatePaneDirection 'Up',
  },
  {
    key = 'j',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.ActivatePaneDirection 'Down',
  },
  -- Make Option-Left equivalent to Alt-b which many line editors interpret as backward-word
  {
    key = "LeftArrow",
    mods = "OPT",
    action = wezterm.action { SendString = "\x1bb" }
  },
  -- Make Option-Right equivalent to Alt-f; forward-word
  {
    key = "RightArrow",
    mods = "OPT",
    action = wezterm.action { SendString = "\x1bf" }
  },
  {
    key = 'l',
    mods = 'ALT',
    action = wezterm.action.ShowLauncherArgs { flags = 'WORKSPACES' }
  },
  { key = "f", mods = "CTRL|SHIFT", action = wezterm.action_callback(sessionizer.toggle) },
}

function recompute_padding(window)
  local window_dims = window:get_dimensions()
  local overrides = window:get_config_overrides() or {}

  if not window_dims.is_full_screen then
    if not overrides.window_padding then
      -- not changing anything
      return
    end
    overrides.window_padding = nil
  else
    local center_size = math.floor(window_dims.pixel_width / 6)
    local new_padding = {
      left = center_size,
      right = center_size,
      top = 0,
      bottom = 0,
    }
    if
        overrides.window_padding
        and new_padding.left == overrides.window_padding.left
    then
      -- padding is same, avoid triggering further changes
      return
    end
    overrides.window_padding = new_padding
  end
  window:set_config_overrides(overrides)
end

wezterm.on('window-resized', function(window, pane)
  recompute_padding(window)
end)

wezterm.on('window-config-reloaded', function(window)
  recompute_padding(window)
end)

return config
