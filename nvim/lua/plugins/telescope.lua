return {
	"nvim-telescope/telescope.nvim",
	dependencies = { "ecthelionvi/NeoComposer.nvim" },
	config = function()
		local telescope = require("telescope")
		telescope.setup({
			pickers = {
				find_files = {
					hidden = true,
					find_command = {
						"fd",
						"--type",
						"f",
						"--hidden",
						"--exclude",
						".git/",
						"--exclude",
						"venv",
						"--exclude",
						"fmod",
                        "--exclude",
                        "*.png",
                        "--exclude",
                        "*.jpg",
                        "--exclude",
                        "*.jpeg",
                        "--exclude",
                        "*.blend",
                        "--exclude",
                        "*/ios",
                        "--exclude",
                        "*/android",
                        "--exclude",
                        "*/macos",
                        "--exclude",
                        "*/linux",
                        "--exclude",
                        "*/windows",
					},
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
