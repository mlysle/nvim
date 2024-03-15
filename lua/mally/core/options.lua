vim.opt.clipboard = 'unnamedplus'

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true

vim.opt.shiftwidth = 2
vim.opt.tabstop = 2

vim.opt.undofile = true
vim.opt.title = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.scrolloff = 8

-- highlight copied text
vim.api.nvim_exec(
	[[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]],
	false
)
vim.opt.conceallevel = 2
-- vim.opt.concealcursor = 'n'

-- 500ms timeout (recommended by whick-key)
vim.opt.timeoutlen = 500

vim.opt.termguicolors = true
-- recognize simply-scheme as racket
vim.g.racket_hash_lang_dict = { ['simply-scheme'] = 'racket' }

-- Always show the signcolumn
-- Prevents the screen from shifting when warnings/errors appear
vim.o.signcolumn = "yes"
