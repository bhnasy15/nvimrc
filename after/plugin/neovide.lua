if vim.g.neovide ~= nil then
	vim.opt.guifont={'Fira_Mono_Medium,Kawkab_Mono:h10'}
	vim.g.neovide_refresh_rate = 50

	vim.keymap.set('n', '<C-+>' ,function()
		vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.05 
	end, {silent= true})

	vim.keymap.set('n', '<C-->' ,function()
		vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.05
	end, {silent= true})

	vim.keymap.set('n', '<C-=>' ,function()
		vim.g.neovide_scale_factor = 1
	end, {silent= true})
	vim.cmd({cmd="hi",args={"Normal", "guibg=#12121A", "guifg=#C4C4C9"}})
end
