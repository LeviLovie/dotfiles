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
						-- your rust-analyzer settings here
						cargo = { allFeatures = true },
						checkOnSave = { command = "clippy" },
					},
				},
			},
		}

		vim.g.rustaceanvim = {
			server = {
				on_attach = function(client, bufnr)
					vim.keymap.set("n", "<leader>a", function()
						vim.cmd.RustLsp("codeAction")
					end, { silent = true, buffer = bufnr })

					vim.keymap.set("n", "K", function()
						vim.cmd.RustLsp({ "hover", "actions" })
					end, { silent = true, buffer = bufnr })

					vim.keymap.set("n", "<leader>j", function()
						vim.cmd.RustLsp({ "moveItem", "down" })
					end, { silent = true, buffer = bufnr })

					vim.keymap.set("n", "<leader>k", function()
						vim.cmd.RustLsp({ "moveItem", "up" })
					end, { silent = true, buffer = bufnr })

					vim.keymap.set("n", "<leader>d", function()
						vim.cmd.RustLsp("openDocs")
					end, { silent = true, buffer = bufnr })

					vim.keymap.set("n", "<leader>t", function()
						vim.lsp.buf.definition()
					end, { silent = true, buffer = bufnr })

					vim.keymap.set("n", "<leader>r", function()
						vim.lsp.buf.references()
					end, { silent = true, buffer = bufnr })
				end,
			},
		}
	end,
}
