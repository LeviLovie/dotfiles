return {
    "puremourning/vimspector",
    dependencies = { "nvim-lua/plenary.nvim" },
    lazy = false,
    config = function()
        vim.g.vimspector_enable_mappings = 'HUMAN'
    end
}
