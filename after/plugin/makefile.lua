vim.api.nvim_create_autocmd("Filetype", {
  pattern = "c",
  callback = function()
    vim.opt.errorformat = "%f:%l:%c: %t%*[a-z]: %m"
  end
})

vim.api.nvim_create_autocmd("Filetype", {
  pattern = "d",
  callback = function()
    vim.opt.errorformat = "%f(%l): %t%*[a-z]: %m"
  end
})

vim.api.nvim_create_autocmd("Filetype", {
  pattern = "vala",
  callback = function()
    vim.opt.errorformat = "%f:%l.%c-%*[0-9].%*[0-9]: %t%*[a-z]: %m"
  end
})

