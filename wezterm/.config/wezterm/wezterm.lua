-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.font = wezterm.font("MonoLisa")
config.font_size = 17

config.window_decorations = "RESIZE"

config.force_reverse_video_cursor = true

config.enable_tab_bar = true
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true

config.colors = {
	tab_bar = {
		background = "#1f1f28",
		active_tab = {
			bg_color = "#1f1f28",
			fg_color = "#dcd7ba",
		},
		inactive_tab = {
			bg_color = "#1f1f28",
			fg_color = "#727169",
		},
		inactive_tab_hover = {
			bg_color = "#2d4f67",
			fg_color = "#c8c093",
			italic = false,
		},
		new_tab = {
			bg_color = "#1f1f28",
			fg_color = "#727169",
		},
		new_tab_hover = {
			bg_color = "#2d4f67",
			fg_color = "#c8c093",
		},
	},
}

config.color_scheme = "Kanagawa (Gogh)"

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
}

return config
