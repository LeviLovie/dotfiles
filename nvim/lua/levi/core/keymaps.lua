-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps -------------------

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- delete without copying to clipboard
keymap.set("n", "<leader>d", '"_d', { desc = "Delete without copying to clipboard" })

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sb", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>s-", "<C-w>-", { desc = "Decrease current window size" }) -- make split windows equal width & height
keymap.set("n", "<leader>s+", "<C-w>+", { desc = "Increase current window size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sh", "<C-w>h", { desc = "Change window to the left" }) -- close current split window
keymap.set("n", "<leader>sj", "<C-w>j", { desc = "Change window to the bottom" }) -- close current split window
keymap.set("n", "<leader>sk", "<C-w>k", { desc = "Change window to the top" }) -- close current split window
keymap.set("n", "<leader>sl", "<C-w>l", { desc = "Change window to the right" }) -- close current split window
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

-- lsp
keymap.set("n", "<leader>la", ":lua vim.lsp.buf.definition()<CR>", { desc = "Go to definition" })
keymap.set("n", "<leader>ls", ":vsplit | lua vim.lsp.buf.definition()<CR>", { desc = "Go to definition in vertical split" })
keymap.set("n", "<leader>lh", ":lua vim.lsp.buf.hover()<CR>", { desc = "Show hover information" })
keymap.set("n", "<leader>lr", ":lua vim.lsp.buf.references()<CR>", { desc = "Show references" })

-- Map ESC to exit out of terminal mode
keymap.set("t", "<Esc>", "<C-\\><C-n>", { noremap = true, silent = true })

keymap.set('n', '<leader>qe', '<cmd>FloatermLast!  --height=0.6 --width=0.6 --wintype=float --position=center<CR>', { desc = "Last Floatern" })
keymap.set('n', '<leader>qw', '<cmd>FloatermToggle!  --height=0.6 --width=0.6 --wintype=float --position=center<CR>', { desc = "Toggle Floatern" })
keymap.set('n', '<leader>qd', '<cmd>FloatermNew!  --height=0.6 --width=0.6 --wintype=float --position=center<CR>', { desc = "New Floatern" })
keymap.set('n', '<leader>qc', '<cmd>FloatermPrev!  --height=0.6 --width=0.6 --wintype=float --position=center<CR>', { desc = "Prev Floatern" })
keymap.set('n', '<leader>qv', '<cmd>FloatermNext!  --height=0.6 --width=0.6 --wintype=float --position=center<CR>', { desc = "Next Floatern" })
