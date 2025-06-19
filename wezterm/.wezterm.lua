-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

config.font = wezterm.font("Moralerspace Radon HWNF")
config.font_size = 12.0

config.color_scheme = "Tokyo Night"

-- Finally, return the configuration to wezterm:
return config
