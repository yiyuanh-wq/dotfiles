-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
    config = wezterm.config_builder()
end

config.audible_bell = "Disabled"
config.font = wezterm.font("Berkeley Mono")
config.font_size = 17

config.color_scheme = "Oxocarbon Dark (Gogh)"

config.use_fancy_tab_bar = false
config.enable_tab_bar = true
config.tab_bar_at_bottom = true
config.window_decorations = "RESIZE"
config.force_reverse_video_cursor = true
config.debug_key_events = true
config.hide_tab_bar_if_only_one_tab = true

return config
