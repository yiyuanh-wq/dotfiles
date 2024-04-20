-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.audible_bell = "Disabled"
config.font = wezterm.font 'Liga SFMono Nerd Font'
config.font_size = 16

config.color_scheme = "Tokyo Night Moon"
config.use_fancy_tab_bar = false
config.enable_tab_bar = true
config.tab_bar_at_bottom = true
config.window_decorations = "RESIZE"
config.force_reverse_video_cursor = true

config.window_padding = {
  left = 8,
  right = 0,
  top = 8,
  bottom = 0
}

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
      size = { Percent = 40 }
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
  { key = "LeftArrow",  mods = "OPT", action = wezterm.action { SendString = "\x1bb" } },
  -- Make Option-Right equivalent to Alt-f; forward-word
  { key = "RightArrow", mods = "OPT", action = wezterm.action { SendString = "\x1bf" } },
}

for i = 1, 8 do
  table.insert(config.keys, {
    key = tostring(i),
    mods = 'CMD|SHIFT',
    action = wezterm.action.ActivateTab(i - 1),
  })
end

return config
