local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require('options')
require('lazy-config')
require('colors')
require('treesitter-config')
require('mason-config')
require('lsp-config.language-servers')
require('cmp-config')
require('neorg-config')
require('telescope-config')
require('alpha-config')
require('dial-config')
require('luasnip-config')
require('null-ls-config')
require('neo-minimap-config')
--require('oil-config')
require('ts-rainbow-config')
require('mappings')
require('mappings')
-- vim.g["aniseed#env"] = { module = "init", compile = true }
-- require('aniseed.env').init()

require "tangerine".setup {}
