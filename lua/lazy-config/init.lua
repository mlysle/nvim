require('lazy').setup({
	-- LSP
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate"
	},
	{
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	},
	{
		"jay-babu/mason-null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"jose-elias-alvarez/null-ls.nvim",
		},
	},
	-- Completion
	'hrsh7th/nvim-cmp',
	'hrsh7th/cmp-nvim-lsp',
	'hrsh7th/cmp-buffer',
	'hrsh7th/cmp-path',
	'hrsh7th/cmp-cmdline',
	'L3MON4D3/LuaSnip',
	'saadparwaiz1/cmp_luasnip',
	'rafamadriz/friendly-snippets',
	{
		'nvim-treesitter/nvim-treesitter',
		build = ':TSUpdate',
	},
	'nvim-treesitter/playground',
	{
		'nvim-treesitter/nvim-treesitter-textobjects',
	},
	{
		'nvim-neorg/neorg',
		build = ":Neorg sync-parsers",
		dependencies = 'nvim-lua/plenary.nvim',
	},
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.0',
		dependencies = 'nvim-lua/plenary.nvim',
	},
	{
		'catppuccin/nvim', name = 'catppuccin',
	},
	{
		'goolord/alpha-nvim',
		dependencies = 'kyazdani42/nvim-web-devicons',
	},
	'numToStr/Comment.nvim',
	'monaqa/dial.nvim',
	'MunifTanjim/nui.nvim',
	{
		'arsham/indent-tools.nvim',
		dependencies = 'arsham/arshlib.nvim',
		config = true,
	},
	--'jose-elias-alvarez/null-ls.nvim',
	-- for SICP
	'benknoble/vim-racket',
	'Olical/conjure',
	'gpanders/nvim-parinfer',
	'onsails/lspkind.nvim',
	{ 'echasnovski/mini.nvim', version = false },
	--'ziontee113/neo-minimap',
	--'glacambre/firenvim',
	'stevearc/oil.nvim',
	'HiPhish/rainbow-delimiters.nvim',
	'udayvir-singh/tangerine.nvim',
	'ThePrimeagen/harpoon',
	{
		'akinsho/toggleterm.nvim',
		version = "*",
		config = true
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		}
	}
})
