return {
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			"jay-babu/mason-nvim-dap.nvim",
		},
		config = function()
			require("mason").setup()
			require("mason-nvim-dap").setup()
			require("mason-lspconfig").setup({
				ensure_installed = {},
				automatic_installation = true,
			})

			local mason_tool_installer = require("mason-tool-installer")

			mason_tool_installer.setup({
				ensure_installed = {
					"prettier", -- prettier formatter
					"stylua", -- lua formatter
					"isort", -- python formatter
					"black", -- python formatter
					"pylint", -- python linter
					"eslint_d", -- js linter
					"clang-format",
					"clangd",
					"texlab",
				},
			})
		end,
	},
}
