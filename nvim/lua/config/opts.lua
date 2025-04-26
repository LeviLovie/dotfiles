--Set completeopt to have a better completion experience
-- :help completeopt
-- menuone: popup even when there's only one match
-- noinsert: Do not insert text until a selection is made
-- noselect: Do not select, force to select one from the menu
-- shortness: avoid showing extra messages when using completion
-- updatetime: set updatetime for CursorHold
vim.opt.completeopt = { "menuone", "noselect", "noinsert" }
vim.opt.shortmess = vim.opt.shortmess + { c = true }
vim.api.nvim_set_option("updatetime", 150)

--Expressions are foldeded by default
-- vim.wo.foldmethod = 'expr'
-- vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'

-- Fixed column for diagnostics to appear
-- Show autodiagnostic popup on cursor hover_range
-- Goto previous / next diagnostic warning / error
-- Show inlay_hints more frequently
vim.cmd([[
    set signcolumn=yes
    set clipboard+=unnamedplus

    command! W w
    command! Q q
    command! WQ wq
    command! Wq wq


    set number
    augroup numbertoggle
      autocmd!
      autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
      autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
    augroup END
]])

vim.o.tabstop = 4
vim.o.expandtab = true
vim.o.softtabstop = 4
vim.o.shiftwidth = 4

-- Define subtle background-only highlight group
-- vim.api.nvim_set_hl(0, "ScrollEdge", { bg = "#2c2c2c", fg = "NONE" })
--
-- local ns_id = vim.api.nvim_create_namespace("ScrollEdgeHL")
--
-- local function update_scroll_edges()
-- 	local bufnr = vim.api.nvim_get_current_buf()
-- 	local cur_line = vim.api.nvim_win_get_cursor(0)[1] - 1
-- 	local line_count = vim.api.nvim_buf_line_count(bufnr)
--
-- 	vim.api.nvim_buf_clear_namespace(bufnr, ns_id, 0, -1)
--
-- 	for _, offset in ipairs({ -8, 8 }) do
-- 		local line = cur_line + offset
-- 		if line >= 0 and line < line_count then
-- 			vim.api.nvim_buf_add_highlight(bufnr, ns_id, "ScrollEdge", line, 0, -1)
-- 		end
-- 	end
-- end
--
-- vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
-- 	callback = update_scroll_edges,
-- })
