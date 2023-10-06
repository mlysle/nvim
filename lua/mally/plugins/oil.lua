return {
	'stevearc/oil.nvim',
	opts = {},
	-- Optional dependencies
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local oil = require("oil")
		oil.setup()
		local map = vim.keymap.set
		map("n", "--", require("oil").open, { desc = "Open parent directory" })
	end,
}
