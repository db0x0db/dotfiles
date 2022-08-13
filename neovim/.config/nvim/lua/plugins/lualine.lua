-- Theme
local colors = require("colors")
local solarized_dark = require("lualine.themes.solarized_dark")
solarized_dark.normal.c.bg = colors.base03
solarized_dark.normal.b.bg = colors.base02
solarized_dark.normal.b.fg = colors.base1
solarized_dark.insert.a.bg = colors.yellow
solarized_dark.command = { a = { fg = colors.base03, bg = colors.cyan, gui = "bold" } }

local lspclient = {
	function()
		local clients = vim.lsp.buf_get_clients()
		local client_names = ""
		for _, client in pairs(clients) do
			if string.len(client_names) < 1 then
				client_names = client.name
			else
				client_names = client_names .. " " .. client.name
			end
		end
		return client_names
	end,
	icons_enabled = true,
	icon = "",
	color = function(section)
		local f_name, f_ext = vim.fn.expand("%:t"), vim.fn.expand("%:e")
		local icon, color = require("nvim-web-devicons").get_icon_color(f_name, f_ext)
		return { fg = color }
	end,
}

require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = solarized_dark,
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = {
			statusline = {},
			winbar = {},
		},
		ignore_focus = { "NvimTree", "Outline" },
		always_divide_middle = true,
		globalstatus = true,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		},
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = {
			{ "branch", icon = "" },
			{ "diff", symbols = { added = " ", modified = " ", removed = " " } },
		},
		lualine_c = { lspclient, "diagnostics" },
		lualine_x = { "encoding", "fileformat", "filetype" },
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	winbar = {},
	inactive_winbar = {},
	extensions = {},
})
