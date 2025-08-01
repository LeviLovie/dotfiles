return {
	"zbirenbaum/copilot-cmp",
	dependencies = {
		"zbirenbaum/copilot.lua",
	},
    keys = {
        { "<leader>ce", ":Copilot enable<CR>", desc = "Copilot enable" },
        { "<leader>cd", ":Copilot disable<CR>", desc = "Copilot disable" },
    },
	config = function()
		require("copilot").setup({
			suggestion = { enabled = false },
			panel = { enabled = false },
		})
		require("copilot_cmp").setup()
	end,
}
