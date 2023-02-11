return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	-- LSP
	use 'williamboman/mason.nvim'
	use 'williamboman/mason-lspconfig.nvim'
	use 'neovim/nvim-lspconfig'
	-- Completion
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'L3MON4D3/LuaSnip'
	use 'saadparwaiz1/cmp_luasnip'
	use 'rafamadriz/friendly-snippets'
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate',
	}
	use 'nvim-treesitter/playground'
	use {
		'nvim-treesitter/nvim-treesitter-textobjects',
	}
	use {
		'nvim-neorg/neorg',
		requires = {
			{ 'nvim-lua/plenary.nvim' },
			{ 'nvim-neorg/neorg-telescope' },
		},
	}
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.0',
		requires = 'nvim-lua/plenary.nvim',
	}
	use {
		'catppuccin/nvim', as = 'catppuccin',
	}
	use {
		'goolord/alpha-nvim',
		requires = 'kyazdani42/nvim-web-devicons',
	}
	use 'numToStr/Comment.nvim'
	use 'monaqa/dial.nvim'
	use {
		'arsham/indent-tools.nvim',
		requires = 'arsham/arshlib.nvim',
	}
	use 'jose-elias-alvarez/null-ls.nvim'
	-- for SICP
	use 'benknoble/vim-racket'
	use 'olical/conjure'
	use 'gpanders/nvim-parinfer'
	use 'epwalsh/obsidian.nvim'
	use 'jakewvincent/mkdnflow.nvim'
	use 'onsails/lspkind.nvim'
	use 'tzachar/local-highlight.nvim'
end)
