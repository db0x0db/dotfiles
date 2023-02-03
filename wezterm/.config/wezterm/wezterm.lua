local wezterm = require("wezterm")

return {
	disable_default_key_bindings = true,
	keys = {
		{ key = "d", mods = "CMD", action = wezterm.action.SplitHorizontal },
		{ key = "D", mods = "CMD|SHIFT", action = wezterm.action.SplitVertical },
		{ key = "w", mods = "CMD", action = wezterm.action.CloseCurrentPane { confirm = false } },
		{ key = "q", mods = "CMD", action = wezterm.action.QuitApplication },
		{ key = "t", mods = "CMD", action = wezterm.action.SpawnTab "CurrentPaneDomain" },
		{ key = "[", mods = "CMD|SHIFT", action = wezterm.action.ActivateTabRelative(-1) },
		{ key = "]", mods = "CMD|SHIFT", action = wezterm.action.ActivateTabRelative(1) },
		{ key = "LeftArrow", mods = "CMD", action = wezterm.action.ActivatePaneDirection "Left" },
		{ key = "RightArrow", mods = "CMD", action = wezterm.action.ActivatePaneDirection "Right" },
		{ key = "UpArrow", mods = "CMD", action = wezterm.action.ActivatePaneDirection "Up" },
		{ key = "DownArrow", mods = "CMD", action = wezterm.action.ActivatePaneDirection "Down" },
		{ key = "0", mods = "CMD", action = wezterm.action.ResetFontSize },
		{ key = "-", mods = "CMD", action = wezterm.action.DecreaseFontSize },
		{ key = "+", mods = "CMD", action = wezterm.action.IncreaseFontSize },
	},
	color_scheme = "Decaf (base16)",
	font = wezterm.font("JetBrainsMono Nerd Font", {
		weight = "Medium",
	}),
	font_size = 14,
	initial_rows = 1000,
	initial_cols = 1000,
	window_decorations = "TITLE|RESIZE",
	window_padding = {
		left = "2cell",
		right = "2cell",
		top = "1cell",
		bottom = "1cell",
	},
	use_fancy_tab_bar = false,
	hide_tab_bar_if_only_one_tab = true,
	send_composed_key_when_left_alt_is_pressed = false,
	send_composed_key_when_right_alt_is_pressed = false,
	default_cursor_style = "BlinkingBlock",
	cursor_blink_rate = 800,
	cursor_blink_ease_in = "Constant",
	cursor_blink_ease_out = "Constant",
	audible_bell = "Disabled"
}
