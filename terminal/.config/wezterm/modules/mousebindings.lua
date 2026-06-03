local wezterm = require("wezterm")
local module = {}

function module.apply_to_config(config)
	-- Mouse bindings
	config.mouse_bindings = {
		{
			event = { Up = { streak = 1, button = 'Left' } },
			mods = 'NONE',
			action = wezterm.action.CompleteSelection('Clipboard')
		},
		-- 对应 { mouse = "Right", mods = "None", action = "Paste" }
		{
			event = { Down = { streak = 1, button = "Right" } },
			mods = "NONE",
			action = wezterm.action.PasteFrom("Clipboard")
		},
		-- Scaling font-size (Ctrl + 滚轮)
		{
			event = { Down = { streak = 1, button = { WheelUp = 1 } } },
			mods = "CTRL",
			action = wezterm.action.IncreaseFontSize,
		},
		{
			event = { Down = { streak = 1, button = { WheelDown = 1 } } },
			mods = "CTRL",
			action = wezterm.action.DecreaseFontSize,
		},
		{
			event = { Down = { streak = 1, button = "Middle" } },
			mods = "CTRL",
			action = wezterm.action.ResetFontSize,
		},
	}
end

return module