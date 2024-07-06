vim.cmd.packadd({ "nvim-lspconfig" })
vim.cmd.packadd({ "mason-lspconfig.nvim" })
vim.cmd.packadd({ "cmp-nvim-lsp" })

local cmp_lsp = require("cmp_nvim_lsp")

cmp_lsp.setup()

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = cmp_lsp.default_capabilities(capabilities)

local lspconfig = require("lspconfig")

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	virtual_text = false,
	underline = true,
	update_in_insert = false,
	signs = false,
})
local on_attach = {}
if vim.g.loaded_telescope == 1 then
	local builtin = require("telescope.builtin")

	vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
	vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
	vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
	vim.keymap.set("n", "<space>q", builtin.diagnostics)

	on_attach = function(client, buf)
		vim.bo[buf].omnifunc = "v:lua.vim.lsp.omnifunc"
		local opts = { buffer = buf }
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "gd", builtin.lsp_definitions, opts)
		vim.keymap.set("n", "gI", builtin.lsp_incoming_calls, opts)
		vim.keymap.set("n", "gO", builtin.lsp_outgoing_calls, opts)
		vim.keymap.set("n", "gK", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "gi", builtin.lsp_implementations, opts)
		vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
		vim.keymap.set("n", "<space>Wa", vim.lsp.buf.add_workspace_folder, opts)
		vim.keymap.set("n", "<space>Wr", vim.lsp.buf.remove_workspace_folder, opts)
		vim.keymap.set("n", "<space>Wl", function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, opts)
		vim.keymap.set("n", "<space>D", builtin.lsp_type_definitions, opts)
		vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
		vim.keymap.set({ "n", "v" }, "<space>ac", vim.lsp.buf.code_action, opts)
		vim.keymap.set("n", "gr", builtin.lsp_references, opts)
		vim.keymap.set("n", "<space>f", function()
			vim.lsp.buf.format({ async = true })
		end, opts)
	end
else
	vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
	vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
	vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
	vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)

	on_attach = function(client, buf)
		vim.bo[buf].omnifunc = "v:lua.vim.lsp.omnifunc"

		local opts = { buffer = buf }
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "gK", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
		vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
		vim.keymap.set("n", "<space>Wa", vim.lsp.buf.add_workspace_folder, opts)
		vim.keymap.set("n", "<space>Wr", vim.lsp.buf.remove_workspace_folder, opts)
		vim.keymap.set("n", "<space>Wl", function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, opts)
		vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
		vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
		vim.keymap.set({ "n", "v" }, "<space>ac", vim.lsp.buf.code_action, opts)
		vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
		vim.keymap.set("n", "<space>f", function()
			vim.lsp.buf.format({ async = true })
		end, opts)
	end
end

lspconfig.clangd.setup({
	on_attach = on_attach,
	autostart = false,
})

lspconfig.csharp_ls.setup({
	on_attach = on_attach,
	autostart = false,
})

-- lspconfig.jdtls.setup({
--     on_attach = on_attach,
--     autostart = false
-- })

-- lspconfig.lua_ls.setup({
--     on_attach = on_attach,
--     autostart = false
-- })

-- lspconfig.phpactor.setup({
--     on_attach = on_attach,
--     autostart = false
-- })

-- lspconfig.pylyzer.setup({
--     on_attach = on_attach,
--     autostart = false
-- })

-- lspconfig.rust_analyzer.setup({
--     on_attach = on_attach,
--     autostart = false
-- })

-- lspconfig.gopls.setup({
--     on_attach = on_attach,
--     autostart = false
-- })
