return {
	"sbdchd/neoformat",
	config = function()
		vim.g.neoformat_enabled_rust = { "rustfmt" }
		-- Format on save
		vim.api.nvim_exec(
			[[
            augroup fmt
            autocmd!
            autocmd BufWritePre * undojoin | Neoformat
            augroup END
        ]],
			false
		)
	end,
}
