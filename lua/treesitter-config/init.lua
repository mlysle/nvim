local present, treesitter = pcall(require, "nvim-treesitter.configs")

if not present then return end

require 'nvim-treesitter.configs'.setup {
	options = {
		ensure_installed = {
			"bash",
			"css",
			"help",
			"html",
			"fish",
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
			"yaml",
		},
		auto_install = true,

		indent = {
			enable = true
		},

		highlight = {
			enable = true,
		},
	},
	textobjects = {
		select = {
			enable = true,

			-- Automatically jump forward to textobj, similar to targets.vim
			lookahead = true,

			keymaps = {
				-- You can use the capture groups defined in textobjects.scm
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@conditional.outer",
				["ic"] = "@conditional.inner",
			},
			-- You can choose the select mode (default is charwise 'v')
			selection_modes = {
				['@parameter.outer'] = 'v', -- charwise
				['@function.outer'] = 'V', -- linewise
				['@class.outer'] = '<c-v>', -- blockwise
			},
			-- If you set this to `true` (default is `false`) then any textobject is
			-- extended to include preceding xor succeeding whitespace. Succeeding
			-- whitespace has priority in order to act similarly to eg the built-in
			-- `ap`.
			include_surrounding_whitespace = true,
		},
	},
}
