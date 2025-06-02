return {
	"nvim-telescope/telescope.nvim",
	dependencies = { "ecthelionvi/NeoComposer.nvim" },
	config = function()
		local telescope = require("telescope")
		telescope.setup({
			pickers = {
				hidden = true,
				no_ignore = false,
				no_ignore_parent = false,
				find_command = {
					"fd",
					"--type",
					"f",
					"--hidden",
					"--exclude",
					"node_modules",
					"--exclude",
					"dist",
					"--exclude",
					"target",
					"--exclude",
					"*.o",
					"--exclude",
					"*.class",
					"--exclude",
					"venv",
				},
			},
		})

		telescope.load_extension("macros")

		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
		vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
		vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
		vim.keymap.set("n", "<leader>fm", ":Telescope macros<CR>", { desc = "Telescope macros" })
	end,
}
