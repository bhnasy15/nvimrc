vim.cmd.packadd({ "packer.nvim" })

require("yPrime.config.packer")

return require("packer").startup(function(use)
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.4",
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	use({ "nvim-treesitter/nvim-treesitter" })
	use({ "mbbill/undotree" })
	use({ "tpope/vim-fugitive" })
	use({ "windwp/nvim-autopairs" })
	use({ "kylechui/nvim-surround", tag = "*" })
	use({ "numToStr/Comment.nvim" })
	use({ "stevearc/conform.nvim" })
	use({ "mg979/vim-visual-multi" })
	--optional
	use({
		"wbthomason/packer.nvim",
		opt = true,
	})
	use({
		"neovim/nvim-lspconfig",
		requires = {
			{ "williamboman/mason.nvim", opt = true },
			{ "williamboman/mason-lspconfig.nvim", opt = true },
		},
		opt = true,
	})
	use({
		"rcarriga/nvim-dap-ui",
		requires = {
			{ "mfussenegger/nvim-dap", opt = true },
			{ "nvim-neotest/nvim-nio", opt = true },
		},
		opt = true,
	})
	use({
		"hrsh7th/nvim-cmp",
		requires = {
			{
				"L3MON4D3/LuaSnip",
				requires = { "rafamadriz/friendly-snippets", opt = true },
				opt = true,
				run = "make install_jsregexp",
			},
			{ "saadparwaiz1/cmp_luasnip", opt = true },
			{ "hrsh7th/cmp-nvim-lsp", opt = true },
			{ "hrsh7th/cmp-buffer", opt = true },
			{ "hrsh7th/cmp-path", opt = true },
			{ "hrsh7th/cmp-cmdline", opt = true },
		},
		opt = true,
	})
end)
