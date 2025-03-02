vim.g.mapleader = " "
local keymap = vim.keymap

-- <leader>g{hjkl} to move between windows
keymap.set('n', "<leader>gh", "<C-w>h")
keymap.set('n', "<leader>gj", "<C-w>j")
keymap.set('n', "<leader>gk", "<C-w>k")
keymap.set('n', "<leader>gl", "<C-w>l")

-- <leader>g{-|} to split windows
keymap.set('n', "<leader>g-", "<C-w>s")
keymap.set('n', "<leader>g|", "<C-w>v")

-- <Leader>g{HJKL} to resize windows
keymap.set('n', "<leader>gH", "<C-w><")
keymap.set('n', "<leader>gJ", "<C-w>-")
keymap.set('n', "<leader>gK", "<C-w>+")
keymap.set('n', "<leader>gL", "<C-w>>")

-- <leader>gx to close window
-- <leader>gX to close all windows except current
keymap.set('n', "<leader>gx", "<C-w>c")
keymap.set('n', "<leader>gc", "<C-w>o")
