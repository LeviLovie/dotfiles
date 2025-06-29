vim.opt.clipboard = "unnamedplus"

vim.opt.completeopt = { "menuone", "noselect", "noinsert" }
vim.opt.shortmess = vim.opt.shortmess + { c = true }
vim.api.nvim_set_option("updatetime", 150)

vim.o.tabstop = 4
vim.o.expandtab = true
vim.o.softtabstop = 4
vim.o.shiftwidth = 4

vim.cmd([[
    set signcolumn=yes
    autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })

    command! W w
    command! Q q
    command! Qa qa
    command! WQ wq
    command! Wq wq

    set number
    augroup numbertoggle
      autocmd!
      autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
      autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
    augroup END
]])

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = "*.rhai",
	command = "setfiletype rust",
})

vim.diagnostic.config({
	signs = {
		priority = 10,
		error = { text = "E" },
		warn = { text = "W" },
		hint = { text = "H" },
		info = { text = "I" },
	},
	virtual_text = false,
	signs = true,
	update_in_insert = true,
	underline = true,
	severity_sort = false,
	float = {
		border = "rounded",
		source = "always",
		header = "",
		prefix = "",
	},
})

local default_handler = vim.lsp.handlers["window/showMessage"]

vim.lsp.handlers["window/showMessage"] = function(err, result, ctx, config)
	if result and result.message and result.message:match("took") then
		return
	end
	return default_handler(err, result, ctx, config)
end
