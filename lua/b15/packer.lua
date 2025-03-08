vim.cmd.packadd({ "packer.nvim" })

return require("packer").startup(function(use)
	use({ "mbbill/undotree" })
	use({ "tpope/vim-fugitive" })
	use({ "mg979/vim-visual-multi" })
	--optional
	use({
		"wbthomason/packer.nvim",
		opt = true,
	})
end)
