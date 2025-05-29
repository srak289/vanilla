local wezterm = require("wezterm")

-- local config = W.config_builder()
local config = {}
config.color_scheme = "kanagawa-wave"

config.enable_tab_bar = false

-- does not support ${HOME} variable expansion
config.font_dirs = {"/home/srak/.fonts"}
config.font_locator = "ConfigDirsOnly"
config.font = wezterm.font("Mononoki Nerd Font Mono", {weight="Regular"})
config.font_size = 12

config.window_padding = {
  left = 1,
  right = 0,
  top = 0,
  bottom = 0,
}
-- affects terminal translucency
config.window_background_opacity = 1.0
config.text_background_opacity = 1.0

config.warn_about_missing_glyphs = false

return config
