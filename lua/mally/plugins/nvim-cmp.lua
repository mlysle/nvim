return {
	'hrsh7th/nvim-cmp',
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-buffer", -- source for text in buffer
		"hrsh7th/cmp-path", -- source for file system paths
		'hrsh7th/cmp-nvim-lsp',
		'hrsh7th/cmp-cmdline',
		"L3MON4D3/LuaSnip",           -- snippet engine
		"saadparwaiz1/cmp_luasnip",   -- for autocompletion
		"rafamadriz/friendly-snippets", -- useful snippets
		"onsails/lspkind.nvim",       -- vs-code like pictograms
	},

	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")

		luasnip.config.set_config({
			history = true, -- enable jumpback
			updateevents = "TextChanged,TextChangedI",
			region_check_events = 'InsertEnter',
			delete_check_events = 'InsertLeave'
		})

		-- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
		require("luasnip.loaders.from_vscode").lazy_load()

		local lspkind = require("lspkind")

		local has_words_before = function()
			local line, col = unpack(vim.api.nvim_win_get_cursor(0))
			return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
		end

		vim.opt.completeopt = "menuone,noselect"

		local options = {
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			window = {
				completion = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
			},
			experimental = {
				ghost_text = true,
			},
			formatting = {
				fields = { 'abbr', 'menu', 'kind' },
				format = lspkind.cmp_format({
					mode = "symbol", -- show oly symbols
					menu = ({
						nvim_lsp = '[LSP]',
						nvim_lua = 'nvim',
						luasnip = '[snip]',
						path = '[path]',
						buffer = '[buffer]'
					}),
				}),
			},
			mapping = {
				["<C-d>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-y>"] = cmp.mapping.confirm {
					behavior = cmp.ConfirmBehavior.Replace,
					select = true, -- select first item if nothing is selected
				},
				['<C-e>'] = cmp.mapping({ i = cmp.mapping.abort(), c = cmp.mapping.close() }),
				["<C-j>"] = cmp.mapping.select_next_item(),
				["<C-k>"] = cmp.mapping.select_prev_item(),
				["<C-Space>"] = cmp.mapping.complete(),
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump()
					elseif has_words_before() then
						cmp.complete()
					else
						fallback()
					end
				end, { "i", "s" }),

				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),
			},
			sources = {
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "neorg" },
				{ name = "nvim_lua" },
				{ name = "buffer",  keyword_length = 5 },
				{ name = "path" },
			},
		}
		cmp.setup(options)
	end,
}
