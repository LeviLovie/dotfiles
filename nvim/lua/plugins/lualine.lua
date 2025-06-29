return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			options = {
				icons_enabled = true,
				theme = "auto",
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = {
					statusline = {},
					winbar = {},
				},
				ignore_focus = {},
				always_divide_middle = true,
				always_show_tabline = true,
				globalstatus = false,
				refresh = {
					statusline = 100,
					tabline = 100,
					winbar = 100,
				},
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = {
					"branch",
					{
						"diff",
						symbols = { added = "+", modified = "~", removed = "-" },
					},
				},
				lualine_c = {
					{ "filename", path = 1 }, -- 1 = relative path
				},
				lualine_x = {
					{ require("NeoComposer.ui").status_recording },
					{
						"diagnostics",
						sources = { "nvim_diagnostic" },
						sections = { "error", "warn", "hint" }, -- omit 'info' for compactness
						diagnostics_color = {
							error = "DiagnosticError",
							warn = "DiagnosticWarn",
							hint = "DiagnosticHint",
						},
						symbols = {
							error = " ",
							warn = " ",
							hint = " ",
						},
						colored = true,
						update_in_insert = false,
						always_visible = false,
					},
				},
				lualine_y = {
					"filetype",
				},
				lualine_z = {
					"location",
				},
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
	end,
}
