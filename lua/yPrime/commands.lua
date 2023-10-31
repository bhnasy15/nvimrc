vim.api.nvim_create_user_command('ReqPacker', function()
	require('yPrime.packer')
end, {})

vim.api.nvim_create_user_command('ReqLsp', function()
	require('yPrime.config.cmp')
	require('yPrime.config.lsp')
	require('yPrime.config.mason')
end, {})

vim.api.nvim_create_user_command('ReqMason', function()
	require('yPrime.config.mason')
end, {})

vim.api.nvim_create_user_command('ReqDap', function()
	require('yPrime.config.cmp')
	require('yPrime.config.lsp')
	require('yPrime.config.mason')
	require('yPrime.config.dap')
end, {})

vim.api.nvim_create_user_command('ReqCmp', function()
	require('yPrime.config.cmp')
end, {})

