-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.font = wezterm.font("PragmataPro Mono Liga")
config.font_size = 22

config.window_decorations = "RESIZE"

config.force_reverse_video_cursor = true

config.enable_tab_bar = true
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true

config.color_scheme = "Catppuccin Latte"

config.disable_default_key_bindings = true

config.keys = {
	{
		key = "V",
		mods = "CTRL",
		action = wezterm.action.PasteFrom("Clipboard"),
	},
	{
		key = "C",
		mods = "CTRL",
		action = wezterm.action.CopyTo("Clipboard"),
	},
	{
		key = "w",
		mods = "WIN|CTRL",
		action = wezterm.action.CloseCurrentPane({ confirm = true }),
	},
	{
		key = "v",
		mods = "WIN|CTRL",
		action = wezterm.action.SplitPane {
      direction = "Right",
      size = { Percent = 50 }
    }
	},
	{
		key = "b",
		mods = "WIN|CTRL",
		action = wezterm.action.SplitPane {
      direction = "Down",
      size = { Percent = 50 }
    }
	},
  {
    key = "l",
    mods = "WIN|CTRL",
    action = wezterm.action.ActivatePaneDirection "Right"
  },
  {
    key = "h",
    mods = "WIN|CTRL",
    action = wezterm.action.ActivatePaneDirection "Left"
  },
  {
    key = "j",
    mods = "WIN|CTRL",
    action = wezterm.action.ActivatePaneDirection "Down"
  },
  {
    key = "k",
    mods = "WIN|CTRL",
    action = wezterm.action.ActivatePaneDirection "Up"
  }
}

return config
