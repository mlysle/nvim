return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
	},
	config = function()
		local lspconfig = require("lspconfig")

		local map = vim.keymap.set
		local opts = { noremap = true, silent = true }

		local on_attach = function(_, bufnr)
			opts.buffer = bufnr

			opts.desc = "LSP Go to Declaration"
			map("n", "gD", vim.lsp.buf.declaration, opts)

			opts.desc = "LSP Go to Definition"
			map("n", "gd", vim.lsp.buf.definition, opts)

			opts.desc = "LSP Hover Information"
			map("n", "K", vim.lsp.buf.hover, opts)

			opts.desc = "Lsp Go to implementation"
			map("n", "gi", vim.lsp.buf.implementation, opts)

			opts.desc = "LSP Rename"
			map("n", "gr", vim.lsp.buf.rename, opts)

			opts.desc = "LSP Show References"
			map("n", "gR", vim.lsp.buf.references, opts)

			vim.api.nvim_create_autocmd("CursorHold", {
				buffer = bufnr,
				callback = function()
					local opts = {
						focusable = false,
						close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
						border = 'rounded',
						source = 'always',
						prefix = ' ',
						scope = 'cursor',
					}
					vim.diagnostic.open_float(nil, opts)
				end
			})
		end

		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		lspconfig["lua_ls"].setup({
			on_attach = on_attach,
			capabilities = capabilities,
			settings = {
				Lua = {
					runtime = {
						-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
						enable = true,
						version = "LuaJIT",
					},
					diagnostics = {
						-- Get the language server to recognize the `vim` global
						globals = { "vim" },
					},
					workspace = {
						-- Make the server aware of Neovim runtime files
						library = { vim.api.nvim_get_runtime_file("", true), "~/doc/fortwars/fortwars_server/garrysmod/gamemodes/" },
						checkThirdParty = false,
					},
					-- Do not send telemetry data containing a randomized but unique identifier
					telemetry = {
						enable = false,
					},
				},
			},
		})

		lspconfig["racket_langserver"].setup({
			on_attach = on_attach,
		})

		lspconfig["pyright"].setup({
			on_attach = on_attach,
		})

		lspconfig["bashls"].setup({
			on_attach = on_attach,
		})
		lspconfig["csharp_ls"].setup({
			on_attach = on_attach,
			capabilities = capabilities,
		})
		lspconfig["clangd"].setup({
			on_attach = on_attach,
		})
		lspconfig["texlab"].setup({
			on_attach = on_attach,
		})
	end,
}
