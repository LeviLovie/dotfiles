vim.g.mapleader = " "
local keymap = vim.keymap

keymap.set('n', "<leader>sl", ":call vimspector#Launch()<cr>")
keymap.set('n', "<leader>sr", ":call vimspector#Reset()<cr>")
keymap.set('n', "<leader>ss", ":call vimspector#StepOver()<cr>")
keymap.set('n', "<leader>su", ":call vimspector#StepOut()<cr>")
keymap.set('n', "<leader>si", ":call vimspector#StepInto()<cr>")
keymap.set('n', "<leader>sb", ":call vimspector#ToggleBreakpoint()<cr>")
keymap.set('n', "<leader>sa", ":call vimspector#AddWatch()<cr>")
keymap.set('n', "<leader>se", ":call vimspector#Evaluate()<cr>")
