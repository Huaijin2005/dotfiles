local wezterm = require("wezterm")
local module = {}

function module.apply_to_config(config)
    -- Color scheme
    config.color_scheme = "Catppuccin Mocha"
    -- config.color_scheme = 'Tokyo Night'
    -- config.color_scheme = 'Tokyo Night Day'
    -- config.color_scheme = 'Dracula'

    -- Fonts
    config.font_size = 13
    config.font = wezterm.font_with_fallback({
        { family = "CodeNewRoman Nerd Font" },
        { family = "FiraMono Nerd Font" },
        { family = "Noto Serif CJK SC" },
    })

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
end

return module