local cmp = require("cmp")

local has_words_before = function()
	unpack = unpack or table.unpack
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local luasnip = require("luasnip")
local lspkind = require("lspkind")
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
		-- format = function(entry, item)
		-- 	local short_name = {
		-- 		nvim_lsp = '[LSP]',
		-- 		nvim_lua = 'nvim',
		-- 		luasnip = '[snip]',
		-- 		path = '[path]',
		-- 		buffer = '[buffer]'
		-- 	}

		-- 	local menu_name = short_name[entry.source.name] or entry.source.name
		-- 	item.menu = string.format('%s', menu_name)
		-- 	return item
		-- end,
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
