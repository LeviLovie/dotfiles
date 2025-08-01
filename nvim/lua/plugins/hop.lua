return {
	"phaazon/hop.nvim",
	branch = "v2",
    keys = {
        { "<leader>hw", ":HopWord<CR>", desc = "Hop Words" },
        { "<leader>hl", ":HopLine<CR>", desc = "Hop Lines" },
        { "<leader>hv", ":HopVertical<CR>", desc = "Hop Vertical" }
    },
	config = function()
		require("hop").setup({})
	end,
}
