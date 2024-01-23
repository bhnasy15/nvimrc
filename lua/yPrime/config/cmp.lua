vim.cmd.packadd({'nvim-cmp'})
vim.cmd.packadd({'cmp-buffer'})
vim.cmd.packadd({'cmp-path'})
vim.cmd.packadd({'cmp-cmdline'})
vim.cmd.packadd({'cmp_luasnip'})
vim.cmd.packadd({'LuaSnip'})
vim.cmd.packadd({'friendly-snippets'})

local luasnip = require('luasnip');

require("luasnip.loaders.from_vscode").lazy_load()

local cmp = require'cmp'

local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local ts_utils = require("nvim-treesitter.ts_utils")

cmp.register_source("luasnip", require("cmp_luasnip").new())

cmp.register_source('buffer', require('cmp_buffer'))

cmp.register_source('cmdline', require('cmp_cmdline').new())

cmp.register_source('path', require('cmp_path').new())

local cmp_luasnip = vim.api.nvim_create_augroup("cmp_luasnip", {})

vim.api.nvim_create_autocmd("User", {
	pattern = "LuasnipCleanup",
	callback = function ()
		require("cmp_luasnip").clear_cache()
	end,
	group = cmp_luasnip
})

vim.api.nvim_create_autocmd("User", {
	pattern = "LuasnipSnippetsAdded",
	callback = function ()
		require("cmp_luasnip").refresh()
	end,
	group = cmp_luasnip
})

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
			luasnip.expand(args.body)
		end,
	},
	window = {
	},
	mapping = cmp.mapping.preset.insert({
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm({ select = true }),
		['<Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end, { 'i', 's' }),
		['<S-Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { 'i', 's' }),
	}),
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
	}, {
		{ name = 'buffer' },
		{ name = 'path' },
	})
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
	sources = cmp.config.sources({
		{ name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
	}, {
		{ name = 'buffer' },
	})
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = 'buffer' },
		{ name = 'path' },
	}
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = 'path' },
		{ name = 'buffer' },
	}, {
		{ name = 'cmdline' }
	})
})


local ts_node_func_parens_disabled = {
  -- ecma
  named_imports = true,
  -- rust
  use_declaration = true,
}

local default_handler = cmp_autopairs.filetypes["*"]["("].handler
cmp_autopairs.filetypes["*"]["("].handler = function(char, item, bufnr, rules, commit_character)
  local node_type = ts_utils.get_node_at_cursor():type()
  if ts_node_func_parens_disabled[node_type] then
    if item.data then
      item.data.funcParensDisabled = true
    else
      char = ""
    end
  end
  default_handler(char, item, bufnr, rules, commit_character)
end

cmp.event:on(
  "confirm_done",
  cmp_autopairs.on_confirm_done({
    sh = false,
  })
)
