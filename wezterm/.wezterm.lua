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

config.keys = {
  -- NeovimがC-/を正しく処理できないとのこと
  -- From: https://github.com/wezterm/wezterm/issues/3180
  --
  -- TODO: これは最適な解決法ではなさそう。上記PRが更新されたら別の解決法が見つかるかもしれない。
  { key = "/", mods = "CTRL", action = wezterm.action.SendString("\x1f") },
}

-- Finally, return the configuration to wezterm:
return config
