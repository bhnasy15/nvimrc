vim.g.loaded_python3_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

vim.opt.mouse = "a"
vim.opt.showcmd = true
vim.opt.wildmenu = true
vim.opt.wildmode = "longest:full:lastused"

vim.opt.scrolloff = 10
vim.opt.backspace = "indent,eol,start"

vim.opt.encoding = "UTF-8"

vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.undodir = os.getenv("HOME") .. "/.local/state/nvim/undo"
vim.opt.undofile = true

vim.opt.foldenable = false
vim.opt.foldmethod = "manual"

vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.expandtab = false
vim.opt.smartindent = true

vim.opt.hlsearch = false
vim.opt.showmatch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.cursorline = true

vim.opt.termguicolors = true

vim.opt.wrap = false

vim.opt.spelllang = "ar,en"
