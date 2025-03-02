return {
    "nvim-tree/nvim-tree.lua",
    config = function()
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1
        vim.opt.termguicolors = true
        
        require("nvim-tree").setup({
            view = {
                width = 30,
            },
            filters = {
                dotfiles = false,
            },
        })

	local keymap = vim.keymap
        keymap.set('n', "<leader>rr", ":NvimTreeToggle<cr>")
        keymap.set('n', "<leader>re", ":NvimTreeFocus<cr>")
    end
}
