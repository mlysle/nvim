return require('lazy').setup({
	-- LSP
	'williamboman/mason.nvim',
	'williamboman/mason-lspconfig.nvim',
	'neovim/nvim-lspconfig',
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
		dependencies = {
			{ 'nvim-lua/plenary.nvim' },
			{ 'nvim-neorg/neorg-telescope' },
		},
	},
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.0',
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
	{
		'arsham/indent-tools.nvim',
		dependencies = 'arsham/arshlib.nvim',
	},
	'jose-elias-alvarez/null-ls.nvim',
	-- for SICP
	'benknoble/vim-racket',
	'olical/conjure',
	'gpanders/nvim-parinfer',
	'jakewvincent/mkdnflow.nvim',
	'onsails/lspkind.nvim',
	'tzachar/local-highlight.nvim',
	{ 'echasnovski/mini.nvim', version = false },
	'ziontee113/neo-minimap',
	'glacambre/firenvim',
	'stevearc/oil.nvim',
})
