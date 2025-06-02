return {
	"nvim-treesitter/nvim-treesitter",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = { "lua", "rust", "toml", "cpp", "c", "python", "json", "yaml" },
			auto_install = true,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
			ident = { enable = true },
			rainbow = {
				enable = true,
				extended_mode = true,
				max_file_lines = nil,
			},
		})
	end,
}
