return {
	"mrcjkb/rustaceanvim",
	dependencies = {
		"mfussenegger/nvim-dap",
	},
	version = "^6",
	init = function()
		vim.g.rustaceanvim = {
			server = {
				settings = {
					["rust-analyzer"] = {
						cargo = { allFeatures = true },
						check = { command = "check" },
					},
				},
				on_attach = function(client, bufnr)
					vim.keymap.set("n", "<leader>ra", function()
						vim.cmd.RustLsp("codeAction")
					end, { silent = true, buffer = bufnr })

					vim.keymap.set("n", "<leader>rj", function()
						vim.cmd.RustLsp({ "moveItem", "down" })
					end, { silent = true, buffer = bufnr })

					vim.keymap.set("n", "<leader>rk", function()
						vim.cmd.RustLsp({ "moveItem", "up" })
					end, { silent = true, buffer = bufnr })

					vim.keymap.set("n", "<leader>rd", function()
						vim.cmd.RustLsp("openDocs")
					end, { silent = true, buffer = bufnr })

					vim.keymap.set("n", "<leader>rt", function()
						vim.lsp.buf.definition()
					end, { silent = true, buffer = bufnr })

					vim.keymap.set("n", "<leader>rd", function()
						vim.lsp.buf.references()
					end, { silent = true, buffer = bufnr })
				end,
			},
		}
	end,
}
