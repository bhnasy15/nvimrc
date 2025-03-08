vim.g.loaded_python3_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

vim.cmd.colorscheme("habamax")
vim.cmd.highlight({"Normal", "ctermbg=None", "guibg=None"})

vim.opt.mouse = ""
vim.opt.showcmd = true
vim.opt.wildmenu = true
vim.opt.wop = "fuzzy,tagfile"
vim.opt.wildmode = "longest:full:lastused"

vim.opt.scrolloff = 10
vim.opt.backspace = "indent,eol,start"

vim.opt.encoding = "UTF-8"

vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.local/state/nvim/undo"
vim.opt.shada = "!,'10,<10,s2,h"

vim.opt.foldenable = true
vim.opt.foldmethod = "syntax"

vim.opt.shiftwidth = 4
vim.opt.expandtab = false
vim.opt.smartindent = true
vim.opt.linebreak = true

vim.opt.hlsearch = false
vim.opt.showmatch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 1

vim.opt.cursorline = true

vim.opt.termguicolors = true

vim.opt.wrap = false
