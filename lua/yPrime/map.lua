vim.g.mapleader = ","

vim.keymap.set('n', '<space>w', '<C-W>')
vim.keymap.set('t', '<C-space>', '<C-\\><C-n>')
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')

vim.keymap.set('n', ')', function() vim.cmd.bn{} end, {silent=true})
vim.keymap.set('n', '(', function() vim.cmd.bp{} end, {silent=true})

vim.keymap.set('n', '<leader>tn', vim.cmd.tabnew, {silent=true})
vim.keymap.set('n', '<leader>vo', vim.cmd.Vexplore, {silent=true})
vim.keymap.set('n', '<leader>ho', vim.cmd.Hexplore, {silent=true})
vim.keymap.set('n', '<leader>to', vim.cmd.Texplore, {silent=true})
vim.keymap.set('n', '<leader>oo', vim.cmd.Explore, {silent=true})

-- terminal
vim.keymap.set('n', '<leader>tt', function() vim.cmd('tabnew +term') end, {silent=true})

-- write and/or quit
vim.keymap.set('n', '<leader>W', function() vim.cmd.wall {bang=true} end, {silent=true})
vim.keymap.set('n', '<leader>w', function() vim.cmd.write{} end, {silent=true})
vim.keymap.set('n', '<leader>X', function() vim.cmd.xall{} end, {silent=true})
vim.keymap.set('n', '<leader>x', function() vim.cmd.write{} vim.cmd.close{} end, {silent=true})
vim.keymap.set('n', '<leader>Q', function() vim.cmd.qall{bang=true} end, {silent=true})
vim.keymap.set('n', '<leader>q', function() vim.cmd.close{} end, {silent=true})
vim.keymap.set('n', '<leader>dd', function() vim.cmd.bdel{} end, {silent=true})

-- language
vim.keymap.set('n', '<leader>ar', function() vim.cmd.set{'arabic!'} end, {silent=true})
vim.keymap.set('n', '<leader>sp', function() vim.cmd.set{'spell!'} end, {silent=true})
