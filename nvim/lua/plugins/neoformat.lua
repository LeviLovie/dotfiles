return {
	"sbdchd/neoformat",
	config = function()
		vim.g.neoformat_lua_luaformatter = {
			exe = "stylua",
			args = { "--config-path", vim.fn.expand("~/.config/nvim/lua/plugins/stylua.toml") },
			stdin = 1,
		}

		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = "*",
			command = "Neoformat",
		})
	end,
}
