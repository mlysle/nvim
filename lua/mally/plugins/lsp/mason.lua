return {
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate"
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
		},
	},
	config = function()
		require("mason").setup()
		require("mason-lspconfig").setup {
			automatic_installation = true,
		}
		require("mason-null-ls").setup({
			automatic_installation = true,
		})
	end,
}
