-- Pull in the wezterm API
local wezterm = require("wezterm")

local sessionizer = require("sessionizer")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
    config = wezterm.config_builder()
end

config.window_padding = {
    left = 12,
    right = 12,
    top = 4,
    bottom = 4,
}

config.audible_bell = "Disabled"
config.font = wezterm.font("MesloLGS NF")
config.font_size = 16

config.color_scheme = "Tokyo Night"

config.use_fancy_tab_bar = false
config.enable_tab_bar = true
config.tab_bar_at_bottom = true
config.window_decorations = "RESIZE"
config.force_reverse_video_cursor = true
config.debug_key_events = true
config.hide_tab_bar_if_only_one_tab = true

config.leader = {
    key = "a",
    mods = "CTRL",
    timeout_milliseconds = 1000,
}

config.keys = {
    {
        key = "a",
        mods = "LEADER|CTRL",
        action = wezterm.action({ SendString = "\x01" }),
    },
    {
        key = "-",
        mods = "LEADER",
        action = wezterm.action({ SplitVertical = { domain = "CurrentPaneDomain" } }),
    },
    {
        key = "\\",
        mods = "LEADER",
        action = wezterm.action({ SplitHorizontal = { domain = "CurrentPaneDomain" } }),
    },
    {
        key = "s",
        mods = "LEADER",
        action = wezterm.action({ SplitVertical = { domain = "CurrentPaneDomain" } }),
    },
    {
        key = "v",
        mods = "LEADER",
        action = wezterm.action({ SplitHorizontal = { domain = "CurrentPaneDomain" } }),
    },
    {
        key = "%",
        mods = "LEADER",
        action = wezterm.action({ SplitVertical = { domain = "CurrentPaneDomain" } }),
    },
    {
        key = '"',
        mods = "LEADER",
        action = wezterm.action({ SplitHorizontal = { domain = "CurrentPaneDomain" } }),
    },
    {
        key = "o",
        mods = "LEADER",
        action = "TogglePaneZoomState",
    },
    {
        key = "r",
        mods = "LEADER",
        action = wezterm.action.RotatePanes("Clockwise"),
    },
    {
        key = "c",
        mods = "LEADER",
        action = wezterm.action({ SpawnTab = "CurrentPaneDomain" }),
    },
    {
        key = "h",
        mods = "LEADER",
        action = wezterm.action({ ActivatePaneDirection = "Left" }),
    },
    {
        key = "j",
        mods = "LEADER",
        action = wezterm.action({ ActivatePaneDirection = "Down" }),
    },
    {
        key = "k",
        mods = "LEADER",
        action = wezterm.action({ ActivatePaneDirection = "Up" }),
    },
    {
        key = "l",
        mods = "LEADER",
        action = wezterm.action({ ActivatePaneDirection = "Right" }),
    },
    {
        key = "1",
        mods = "LEADER",
        action = wezterm.action({ ActivateTab = 0 }),
    },
    {
        key = "2",
        mods = "LEADER",
        action = wezterm.action({ ActivateTab = 1 }),
    },
    {
        key = "3",
        mods = "LEADER",
        action = wezterm.action({ ActivateTab = 2 }),
    },
    {
        key = "4",
        mods = "LEADER",
        action = wezterm.action({ ActivateTab = 3 }),
    },
    {
        key = "5",
        mods = "LEADER",
        action = wezterm.action({ ActivateTab = 4 }),
    },
    {
        key = "6",
        mods = "LEADER",
        action = wezterm.action({ ActivateTab = 5 }),
    },
    {
        key = "7",
        mods = "LEADER",
        action = wezterm.action({ ActivateTab = 6 }),
    },
    {
        key = "8",
        mods = "LEADER",
        action = wezterm.action({ ActivateTab = 7 }),
    },
    {
        key = "9",
        mods = "LEADER",
        action = wezterm.action({ ActivateTab = 8 }),
    },
    {
        key = "&",
        mods = "LEADER|SHIFT",
        action = wezterm.action({ CloseCurrentTab = { confirm = true } }),
    },
    {
        key = "d",
        mods = "LEADER",
        action = wezterm.action({ CloseCurrentPane = { confirm = true } }),
    },
    {
        key = "x",
        mods = "LEADER",
        action = wezterm.action({ CloseCurrentPane = { confirm = true } }),
    },
    {
        key = "c",
        mods = "CMD",
        action = wezterm.action.CopyTo("Clipboard"),
    },
    {
        key = "v",
        mods = "CMD",
        action = wezterm.action.PasteFrom("Clipboard"),
    },
    {
        key = "f",
        mods = "LEADER",
        action = wezterm.action_callback(sessionizer.toggle),
    },
    {
        key = "=",
        mods = "CMD",
        action = wezterm.action.DisableDefaultAssignment,
    },
    {
        key = "-",
        mods = "CMD",
        action = wezterm.action.DisableDefaultAssignment,
    },
    {
        key = "=",
        mods = "CTRL",
        action = wezterm.action.DisableDefaultAssignment,
    },
    {
        key = "-",
        mods = "CTRL",
        action = wezterm.action.DisableDefaultAssignment,
    },
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
        local center_size = math.floor(window_dims.pixel_width / 4)
        local new_padding = {
            left = center_size,
            right = center_size,
            top = 0,
            bottom = 0,
        }
        if overrides.window_padding and new_padding.left == overrides.window_padding.left then
            -- padding is same, avoid triggering further changes
            return
        end
        overrides.window_padding = new_padding
    end
    window:set_config_overrides(overrides)
end

wezterm.on("window-resized", function(window, pane)
    recompute_padding(window)
end)

wezterm.on("window-config-reloaded", function(window)
    recompute_padding(window)
end)

return config
