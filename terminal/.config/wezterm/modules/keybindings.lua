local wezterm = require("wezterm")
local module = {}

function module.apply_to_config(config)
    config.disable_default_key_bindings = true
    -- Key bindings
    local split_mod = "CTRL"
    config.keys = {
        -- -- ===== Split windows (SUPER + h/j/k/l) =====
        -- { key = 'h', mods = split_mod, action = wezterm.action.SplitPane { direction = 'Left' } },
        -- { key = 'j', mods = split_mod, action = wezterm.action.SplitPane { direction = 'Down' } },
        -- { key = 'k', mods = split_mod, action = wezterm.action.SplitPane { direction = 'Up' } },
        -- { key = 'l', mods = split_mod, action = wezterm.action.SplitPane { direction = 'Right' } },
        -- { key = 'q', mods = split_mod, action = wezterm.action.CloseCurrentPane { confirm = false } },

        -- -- ===== Focus move (SUPER + SHIFT + h/j/k/l) =====
        -- { key = 'h', mods = split_mod .. '|SHIFT', action = wezterm.action.ActivatePaneDirection 'Left' },
        -- { key = 'j', mods = split_mod .. '|SHIFT', action = wezterm.action.ActivatePaneDirection 'Down' },
        -- { key = 'k', mods = split_mod .. '|SHIFT', action = wezterm.action.ActivatePaneDirection 'Up' },
        -- { key = 'l', mods = split_mod .. '|SHIFT', action = wezterm.action.ActivatePaneDirection 'Right' },
        
        -- Ctrl + =/+ Increase font size
        { key = "=", mods = "CTRL", action = wezterm.action.IncreaseFontSize },
        { key = "+", mods = "CTRL", action = wezterm.action.IncreaseFontSize },

        -- Ctrl + - Decrease font size
        { key = "-", mods = "CTRL", action = wezterm.action.DecreaseFontSize },

        -- Ctrl + 0 Reset font size
        { key = "0", mods = "CTRL", action = wezterm.action.ResetFontSize },

        -- Copy & Paste
        { key = "c", mods = "CTRL|SHIFT", action = wezterm.action.CopyTo("Clipboard") },
        { key = "v", mods = "CTRL|SHIFT", action = wezterm.action.PasteFrom("Clipboard") },

        -- 强制换行
        { key = "Enter", mods = "SHIFT", action = wezterm.action.SendString("\n") },
    }
end

return module