vim.g.netrw_banner          = 0
vim.g.netrw_liststyle       = 1
vim.g.netrw_timefmt         = "%T %d %b %Y"
vim.g.netrw_list_hide       = vim.fn["netrw_gitignore#Hide"]() .. ',' .. '.git/'
vim.g.netrw_sizestyle       = "h"
