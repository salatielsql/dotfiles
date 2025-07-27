local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
    config = wezterm.config_builder()
end
-- config.font = wezterm.font("Lilex")
config.font_size = 16
config.color_scheme = "catppuccin-mocha"
config.window_background_opacity = 0.97
config.tab_bar_at_bottom = false
config.use_fancy_tab_bar = false
config.window_decorations = "RESIZE"

return config
