-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
-- lua-style tables are used for configuration.
local config = wezterm.config_builder()
config:set_strict_mode(true)
config = {
	automatically_reload_config = true,
	enable_tab_bar = false,
	window_close_confirmation = "NeverPrompt",
	front_end = "WebGpu",
}

-- DPI scaling
config.allow_square_glyphs_to_overflow_width = "Always"
config.dpi_by_screen = {
	-- ['HDMI-1-0'] = 192,  -- X11: use `xrandr` to find the display name
	["eDP"] = 144,
}

require("modules.appearance").apply_to_config(config)
require("modules.keybindings").apply_to_config(config)
require("modules.mousebindings").apply_to_config(config)

-- Input method
config.use_ime = true
config.enable_csi_u_key_encoding = false

-- Login shell
local is_windows = wezterm.target_triple:find("windows") ~= nil
if is_windows then
  config.default_prog = { 'pwsh.exe', '-NoLogo' }
end

-- Finally, return the configuration to wezterm:
return config
