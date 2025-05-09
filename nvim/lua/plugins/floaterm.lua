return {
	"voldikss/vim-floaterm",
	config = function()
		local keymap = vim.keymap
		keymap.set("n", "<leader>ft", ":FloatermNew --name=myfloat --height=0.8 --width=0.8 --autoclose=2 fish <CR> ")
		keymap.set("n", "<leader>h", ":FloatermToggle myfloat<CR>")
		keymap.set("t", "<Esc>", "<C-\\><C-n>:q<CR>")
	end,
}
