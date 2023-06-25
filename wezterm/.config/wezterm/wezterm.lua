-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.font = wezterm.font("MonoLisa")
config.font_size = 20

config.window_decorations = "RESIZE"

config.force_reverse_video_cursor = true

config.enable_tab_bar = true
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true

config.colors = {
	tab_bar = {
		background = "#323d43",
		active_tab = {
			bg_color = "#323d43",
			fg_color = "#d8caac",
		},
		inactive_tab = {
			bg_color = "#323d43",
			fg_color = "#505a60",
		},
		inactive_tab_hover = {
			bg_color = "#83b6af",
			fg_color = "#d9bb80",
			italic = false,
		},
		new_tab = {
			bg_color = "#323d43",
			fg_color = "#505a60",
		},
		new_tab_hover = {
			bg_color = "#83b6af",
			fg_color = "#d9bb80",
		},
	},
}

config.color_scheme = "Everforest Dark (Gogh)"

config.disable_default_key_bindings = true

config.keys = {
	{
		key = "V",
		mods = "CMD",
		action = wezterm.action.PasteFrom("Clipboard"),
	},
	{
		key = "C",
		mods = "CMD",
		action = wezterm.action.CopyTo("Clipboard"),
	},
	{
		key = "q",
		mods = "CMD",
		action = wezterm.action.CloseCurrentPane({ confirm = true }),
	},
	{
		key = "t",
		mods = "CMD",
		action = wezterm.action.SpawnTab("CurrentPaneDomain"),
	},
	{
		key = "w",
		mods = "CMD",
		action = wezterm.action.CloseCurrentTab({ confirm = true }),
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
