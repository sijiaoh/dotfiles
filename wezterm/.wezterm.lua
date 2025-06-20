-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

config.font = wezterm.font("Moralerspace Radon HWNF")
config.font_size = 12.0

config.color_scheme = "Tokyo Night"

config.enable_tab_bar = false

config.use_ime = true
config.macos_forward_to_ime_modifier_mask = "SHIFT|CTRL"

-- Finally, return the configuration to wezterm:
return config
