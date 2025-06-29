return {
	"folke/trouble.nvim",
	opts = {},
	cmd = "Trouble",
	keys = {
		{
			"<leader>xx",
			":Trouble<cr>",
			desc = "Diagnostics (Trouble)",
		},
		{
			"<leader>e",
			function()
				local all_diags = vim.diagnostic.get()
				for _, d in ipairs(all_diags) do
					if d.severity == vim.diagnostic.severity.ERROR or d.severity == vim.diagnostic.severity.WARN then
						vim.api.nvim_set_current_buf(d.bufnr)
						vim.api.nvim_win_set_cursor(0, { d.lnum + 1, d.col })
						return
					end
				end
				vim.notify("No error or warning diagnostics found", vim.log.levels.INFO)
			end,
			desc = "Jump to first error",
		},
	},
}
