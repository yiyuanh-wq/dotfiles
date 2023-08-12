-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.font = wezterm.font("PragmataPro Mono Liga")
config.font_size = 20

config.window_decorations = "RESIZE"

config.force_reverse_video_cursor = true

config.enable_tab_bar = true
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true

config.color_scheme = "Everforest Light (Gogh)"

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
		key = "q",
		mods = "CTRL",
		action = wezterm.action.CloseCurrentPane({ confirm = true }),
	},
	{
		key = "t",
		mods = "CTRL",
		action = wezterm.action.SpawnTab("CurrentPaneDomain"),
	},
	{
		key = "w",
		mods = "CTRL",
		action = wezterm.action.CloseCurrentTab({ confirm = true }),
	},
	{
		key = "v",
		mods = "CTRL",
		action = wezterm.action.SplitPane {
      direction = "Right",
      size = { Percent = 50 }
    }
	},
	{
		key = "b",
		mods = "CTRL",
		action = wezterm.action.SplitPane {
      direction = "Down",
      size = { Percent = 50 }
    }
	},
}

for i = 1, 8 do
	table.insert(config.keys, {
		key = tostring(i),
		mods = "CTRL",
		action = wezterm.action.ActivateTab(i - 1),
	})
end

return config
