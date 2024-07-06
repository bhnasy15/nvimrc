vim.cmd.packadd({"mason.nvim"})
vim.cmd.packadd({"mason-lspconfig.nvim"})
local mason = require("mason")
local mason_lsp = require("mason-lspconfig")

local mason_settings = {
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗"
		}
	}
}

local mason_lsp_settings = {
	ensure_installed = {},
	automatic_installation = false,
	handlers = nil,
}

mason.setup(mason_settings)
mason_lsp.setup(mason_lsp_settings)
