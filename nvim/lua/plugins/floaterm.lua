return {
	"voldikss/vim-floaterm",
    keys = {
        { "<leader>go", ":FloatermNew --height=0.8 --width=0.8<CR>", desc = "Floaterm New" },
        { "<leader>gg", ":FloatermToggle<CR>", desc = "Floaterm Toggle" },
        { "<leader>gn", ":FloatermNext<CR>", desc = "Floaterm Next" },
        { "<leader>gp", ":FloatermPrev<CR>", desc = "Floaterm Prev" },
        { "<Esc>", "<C-\\><C-n>:FloatermHide<CR>", modes = { "t" }, desc = "Floaterm Close" },
    },
}
