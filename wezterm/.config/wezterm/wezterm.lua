-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
-- lua-style tables are used for configuration.
local config = wezterm.config_builder()

config = {
	automatically_reload_config = true,
	enable_tab_bar = false,
	window_close_confirmation = "NeverPrompt",
	front_end = "WebGpu",
	disable_default_key_bindings = true,
}

-- Color scheme
config.color_scheme = "Catppuccin Mocha"
--config.color_scheme = "Tokyo Night Storm"

-- Fonts
config.font_size = 12
config.font = wezterm.font_with_fallback({
	{ family = "FiraMono Nerd Font" },
	{ family = "Noto Serif CJK SC" },
})

-- DPI scaling
config.allow_square_glyphs_to_overflow_width = "Always"
config.dpi_by_screen = {
	-- ['HDMI-1-0'] = 192,  -- use `xrandr` to find the display name
	["eDP"] = 144,
}

-- Cursor
config.default_cursor_style = "BlinkingBlock"
config.cursor_blink_rate = 600

-- Window
config.window_background_opacity = 0.8
config.window_decorations = "TITLE | RESIZE"
config.scrollback_lines = 10000
config.window_padding = {
	left = "0.5cell",
	right = "0.5cell",
	top = "0.25cell",
	bottom = "0.25cell",
}

-- Animation
config.animation_fps = 60

-- Key bindings
-- config.leader = {
--     {

--     },
-- }

-- Mouse bindings
-- Wayland Selection: Primary & Clipboard
local wayland_display = os.getenv("WAYLAND_DISPLAY")
local is_wayland = (wayland_display ~= nil and wayland_display ~= "")
local right_click_paste_action
if is_wayland then
	right_click_paste_action = wezterm.action.PasteFrom("PrimarySelection")
else
	right_click_paste_action = wezterm.action.PasteFrom("Clipboard")
end

config.mouse_bindings = {
	-- 对应 { mouse = "Right", mods = "None", action = "Paste" }
	{
		event = { Down = { streak = 1, button = "Right" } },
		mods = "NONE",
		-- action = wezterm.action.PasteFrom("Clipboard"), -- Wayland: PrimarySelection
		action = right_click_paste_action,
	},
	-- 对应 { mouse = "Right", mods = "Control", action = "None" }
	-- 禁止 Ctrl + 右键 的任何默认行为
	{
		event = { Down = { streak = 1, button = "Right" } },
		mods = "CTRL",
		action = wezterm.action.Nop,
	},
}

-- Input method
config.use_ime = true
config.enable_csi_u_key_encoding = false

-- Finally, return the configuration to wezterm:
return config
