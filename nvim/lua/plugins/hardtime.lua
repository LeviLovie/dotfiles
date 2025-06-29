return {
	"m4xshen/hardtime.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"rcarriga/nvim-notify",
	},
	opts = {
		notification = function(msg)
			vim.notify(msg, vim.log.levels.WARN, {
				title = "Hardtime",
				timeout = 3000,
			})
		end,
		max_count = 40,
	},
	config = function(_, opts)
		local notify_ok, notify = pcall(require, "notify")
		if notify_ok then
			vim.notify = notify
		end

		require("hardtime").setup(opts)
	end,
}
