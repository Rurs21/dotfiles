-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- tab
config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true

local hour = tonumber(os.date("%H"))

if hour >= 6 and hour < 18 then
	config.color_scheme = 'Catppuccin Latte'
else
	config.color_scheme = 'Elementary'
end

wezterm.on('toggle-window-style', function(window, pane)
	local overrides = window:get_config_overrides() or {}
	if not overrides.window_background_opacity then
		overrides.window_background_opacity = 0.9
		overrides.window_decorations = "RESIZE"
	else
		overrides.window_background_opacity = nil
		overrides.window_decorations = "TITLE | RESIZE"
	end
	window:set_config_overrides(overrides)
end)

wezterm.on('toggle-colorscheme', function(window, pane)
	local overrides = window:get_config_overrides() or {}
	if not overrides.color_scheme then
		overrides.color_scheme = 'Catppuccin Latte'
	elseif overrides.color_scheme == 'Elementary' then
		overrides.color_scheme = 'Catppuccin Latte'
	else
		overrides.color_scheme = 'Elementary'
	end
	window:set_config_overrides(overrides)
end)

config.keys = {
	{
		key = 'B',
		mods = 'CTRL',
		action = wezterm.action.EmitEvent 'toggle-window-style',
	},
	{
		key = 'E',
		mods = 'CTRL',
		action = wezterm.action.EmitEvent 'toggle-colorscheme',
	},
}

-- and finally, return the configuration to wezterm
return config

