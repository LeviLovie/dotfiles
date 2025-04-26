vim.g.python3_host_prog = "/usr/bin/python"

require("config.lazy")
require("config.opts")
require("config.keys")

vim.diagnostic.config({
	virtual_text = false,
	signs = false,
	update_in_insert = true,
	underline = true,
	severity_sort = false,
	float = {
		border = "rounded",
		source = "always",
		header = "",
		prefix = "",
	},
})

vim.cmd([[
    set signcolumn=yes
]])
