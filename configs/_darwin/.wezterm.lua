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

local hour = tonumber(os.date("%H"))

if hour >= 6 and hour < 18 then
    config.color_scheme = '3024 Day'
else
    config.color_scheme = '3024 Night'
end

config.colors = {
  -- Make the selection text color fully transparent.
  -- When fully transparent, the current text color will be used.
  selection_fg = 'none',
  -- Set the selection background color with alpha.
  -- When selection_bg is transparent, it will be alpha blended over
  -- the current cell background color, rather than replace it
  selection_bg = 'rgba(50% 50% 50% 50%)',
}

wezterm.on('toggle-window-style', function(window, pane)
  local overrides = window:get_config_overrides() or {}
  if not overrides.window_background_opacity then
    overrides.window_background_opacity = 0.5
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
}


-- and finally, return the configuration to wezterm
return config

