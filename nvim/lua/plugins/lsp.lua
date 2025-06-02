return {
	"williamboman/mason-lspconfig.nvim",

	dependencies = {
		"williamboman/mason.nvim",
	},

	config = function()
		local mason = require("mason")
		local lspconfig = require("mason-lspconfig")

		mason.setup({
			ui = {
				icons = {
					package_installed = "",
					package_pending = "",
					package_uninstalled = "",
				},
			},
		})

		local border = "rounded"
		vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border })
		vim.lsp.handlers["textDucument/signatureHelp"] =
			vim.lsp.with(vim.lsp.handlers.signature_help, { border = border })
	end,
}
