vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "/tmp/*",
	callback = function()
		vim.opt_local.undofile = false
	end,
})

vim.api.nvim_create_user_command('ReqPacker', function()
	require('b15.packer')
end, {})
