local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.color_scheme = "Catppuccin Mocha"
-- config.color_scheme = "Atelier Dune (base16)"
-- config.color_scheme = "Belge (terminal.sexy)"
config.font_size = 12.0
-- config.font = wezterm.font("JetBrains Mono")
config.font = wezterm.font("Iosevka")

-- Window configuration
config.window_background_opacity = 1
config.window_padding = {
	left = 2,
	right = 2,
	top = 0,
	bottom = 0,
}

-- Key bindings
config.keys = {
	{
		key = "t",
		mods = "CMD",
		action = wezterm.action.SpawnTab("CurrentPaneDomain"),
	},
	{
		key = "w",
		mods = "CMD",
		action = wezterm.action.CloseCurrentTab({ confirm = true }),
	},
}

config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true

-- Scrollback
config.scrollback_lines = 10000

config.window_decorations = "RESIZE"

return config
