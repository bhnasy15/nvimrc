local builtin = require('telescope.builtin')
local command = require('telescope.command')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fF', builtin.find_files, {no_ignore = ture})
vim.keymap.set('n', '<leader>fG', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fg', function() 
	local search = vim.fn.input('Grep: ')
	if search ~= "" then
		builtin.grep_string({search = search})
	end
end)
vim.keymap.set('n', '<leader>gf', builtin.git_files, {})
vim.keymap.set('n', '<leader>b', builtin.buffers, {})
vim.keymap.set('n', '<leader>z', command.load_command, {})
