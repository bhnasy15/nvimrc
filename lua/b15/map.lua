vim.keymap.set('n', '<leader>w', '<C-W>')
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')

vim.keymap.set('n', '<leader>dd', function() vim.cmd.bdel({}) end, {silent=true})

vim.keymap.set('n', '<leader>vo', vim.cmd.Vexplore, {silent=true})
vim.keymap.set('n', '<leader>ho', vim.cmd.Hexplore, {silent=true})
vim.keymap.set('n', '<leader>to', vim.cmd.Texplore, {silent=true})
vim.keymap.set('n', '<leader>oo', vim.cmd.Explore, {silent=true})

vim.keymap.set('n', '<leader>tt', function() vim.cmd('tabnew +term') end, {silent=true})

vim.keymap.set('n', '<leader>|', function()
    local cmd = vim.fn.input("$ ")
    vim.cmd.cexpr({'system("' .. cmd .. '")'})
end, {silent=true})
