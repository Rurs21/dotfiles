-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will old the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.term = "wezterm"

-- This is where you actually apply your config choices
local scheme = require 'scheme'
config.color_scheme = scheme.color_scheme

local fonts = require 'fonts'
-- disable ligatures + use zero with a line through
config.harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0', 'zero' }
config.font = wezterm.font_with_fallback(fonts)

-- tab
config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true

config.font_size = 14.0
config.window_padding = {
	left = 0,
	right = 0,
	top = '0.5cell',
	bottom = 0,
}

-- scroll
config.scrollback_lines = 3500

wezterm.on('toggle-window-style', function(window, pane)
	local overrides = window:get_config_overrides() or {}
	if not overrides.window_background_opacity then
		overrides.window_background_opacity = 0.95
		overrides.window_decorations = "RESIZE"
	else
		overrides.window_background_opacity = nil
		overrides.window_decorations = "TITLE | RESIZE"
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
	{
		key = 'N',
		mods = 'CTRL',
		action = wezterm.action.ToggleFullScreen,
	},
}

-- and finally, return the configuration to wezterm
return config

