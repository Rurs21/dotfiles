local wezterm = require 'wezterm'

local light_scheme = 'Catppuccin Latte'
local dark_scheme = 'Elementary' 

function fallback_appearance()
	local hour = tonumber(os.date("%H"))
	if hour >= 6 and hour < 18 then
		return 'Light'
	else
		return 'Dark'
	end
end

-- wezterm.gui is not available to the mux server, so take care to
-- do something reasonable when this config is evaluated by the mux
function get_appearance()
	if wezterm.gui then
		return wezterm.gui.get_appearance()
	end
	return fallback_appearance()
end

function scheme_for_appearance(appearance)
	if appearance:find 'Dark' then
		return dark_scheme
	else
		return light_scheme
	end
end

wezterm.on('toggle-colorscheme', function(window, pane)
	local overrides = window:get_config_overrides() or {}
	if not overrides.color_scheme then
		overrides.color_scheme = light_scheme
	elseif overrides.color_scheme == dark_scheme then
		overrides.color_scheme = light_scheme
	else
		overrides.color_scheme = dark_scheme
	end
	window:set_config_overrides(overrides)
end)

return {
	color_scheme = scheme_for_appearance(get_appearance()),
}
