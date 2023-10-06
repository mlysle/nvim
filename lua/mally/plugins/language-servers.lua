return {
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate"
	},
	{
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	},
	config = function()
	require("mason").setup()
	require("mason-lspconfig").setup {
		automatic_installation = true,
	}

	local capabilities = require("cmp_nvim_lsp").default_capabilities()
		local lspconfig = require('lspconfig')

		local on_attach = function(client, bufnr)
		-- Enable completion triggered by <c-x><c-o>
		vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
		local bufopts = { noremap = true, silent = true, buffer = bufnr }
		vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)

		vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
		vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
		vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
		vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
		vim.keymap.set('n', 'go', vim.lsp.buf.type_definition, bufopts)
		vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
		vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, bufopts)
		vim.keymap.set('n', '<F4>', vim.lsp.buf.code_action, bufopts)
		vim.keymap.set('x', '<F4>', vim.lsp.buf.range_code_action, bufopts)
	end

		lspconfig['lua_ls'].setup {
			on_attach = on_attach,
			capabilities = capabilities,
			settings = {
				Lua = {
					runtime = {
						-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
						version = 'LuaJIT',
					},
					diagnostics = {
						-- Get the language server to recognize the `vim` global
						globals = { 'vim' },
					},
					workspace = {
						-- Make the server aware of Neovim runtime files
						library = vim.api.nvim_get_runtime_file("", true),
						checkThirdParty = false,
					},
					-- Do not send telemetry data containing a randomized but unique identifier
					telemetry = {
						enable = false,
					},
				},
			},
		}

	lspconfig['racket_langserver'].setup {
		on_attach = on_attach,
	}

	lspconfig['pyright'].setup {
		on_attach = on_attach,
	}

	lspconfig['bashls'].setup {
		on_attach = on_attach,
	}
	lspconfig['csharp_ls'].setup {
		on_attach = on_attach,
		capabilities = capabilities,
	}
	lspconfig['clangd'].setup {
		on_attach = on_attach,
	}
	end,
}
