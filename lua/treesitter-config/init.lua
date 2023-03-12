local present, treesitter = pcall(require, "nvim-treesitter.configs")

if not present then return end

local options = {
	ensure_installed = { "lua", "racket", "bash", "html", "norg", "norg_meta", "python", "r", "markdown", "yaml", "latex",
		"css",
		"scss", "vim", "help" },
	auto_install = true,

	indent = {
		enable = true
	},

	highlight = {
		enable = true,
		additional_vim_regex_highlighting = { 'org' },
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
treesitter.setup(options)
