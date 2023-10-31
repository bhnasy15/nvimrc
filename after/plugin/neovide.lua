if vim.g.neovide ~= nil then
  vim.opt.guifont={'Fira\\ Mono\\ Medium,Kawkab\\ Mono:h13'}
  vim.keymap.set('n', '<C-+>' ,function()
	  vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.05 
  end, {silent= true})
  vim.keymap.set('n', '<C-->' ,function()
	  vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.05
  end, {silent= true})
  vim.keymap.set('n', '<C-=>' ,function()
	  vim.g.neovide_scale_factor = 1
  end, {silent= true})
end
