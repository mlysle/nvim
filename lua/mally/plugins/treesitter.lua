return {
	{
		'nvim-treesitter/nvim-treesitter',
		build = ':TSUpdate',
	},
	{
		'nvim-treesitter/nvim-treesitter-textobjects',
	},
	config = function()
		local treesitter = require("nvim-treesitter.configs")
		treesitter.setup {
			ensure_installed = {
				"bash",
				"cpp",
				"css",
				"dockerfile",
				"help",
				"html",
				"fish",
				"gitignore",
				"latex",
				"lua",
				"matlab",
				"markdown",
				"norg",
				"norg_meta",
				"python",
				"r",
				"racket",
				"scss",
				"vim",
				"yaml"
			},
			auto_install = true,

			indent = {
				enable = true,
			},

			highlight = {
				enable = true,
			},
			textobjects = {
				select = {
					enable = true,

					-- Automatically jump forward to textobj, similar to targets.vim
					lookahead = true,

					keymaps = {
						["af"] = "@function.outer",
						["if"] = "@function.inner",
						["ac"] = "@conditional.outer",
						["ic"] = "@conditional.inner",
						["a="] = { query = "@assignment.outer", desc = "Select outer part of an assignment" },
						["i="] = { query = "@assignment.inner", desc = "Select inner part of an assignment" },
						["l="] = { query = "@assignment.lhs", desc = "Select left hand side of an assignment" },
						["r="] = { query = "@assignment.rhs", desc = "Select right hand side of an assignment" },
					},
				},
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space>",
					node_incremental = "<C-space>",
					scope_incremental = false,
					node_decremental = "<bs>",
				},
			},
		}
	end,
}
