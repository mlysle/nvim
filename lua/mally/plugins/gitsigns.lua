return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require('gitsigns').setup()
		local wk = require("which-key")
		wk.register({
			["<leader>g"] = { name = "+git" },
			["<leader>ga"] = { "<cmd>Gitsigns stage_buffer<cr>", "Stage File" },
		})
	end,
}
