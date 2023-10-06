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
vim.g.racket_hash_lang_dict = { ['simply-scheme'] = 'racket' }
require('lazy-config')
require('colors')
require('treesitter-config')
require('rainbow-delimiters-config')
require('lsp-config.language-servers')
require('cmp-config')
require('neorg-config')
require('telescope-config')
require('alpha-config')
require('dial-config')
require('luasnip-config')
require('oil-config')
--require('which-key-config')
require('comment-config')
require('harpoon')
require('toggleterm-config')
require('keybindings')
