return {
	"phaazon/hop.nvim",
	branch = "v2",
	config = function()
		require("hop").setup({})

		local keymap = vim.keymap
		keymap.set("n", "<leader>fd", ":HopWord<cr>")
		keymap.set("n", "<leader>fs", ":HopLine<cr>")
		keymap.set("n", "<leader>fv", ":HopVertical<cr>")
	end,
}
