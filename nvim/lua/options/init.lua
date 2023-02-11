vim.opt.clipboard = 'unnamedplus'

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true

vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
-- vim.opt.softtabstop = 2             -- 1 tab == 4 spaces
-- vim.opt.autoindent = true
-- vim.opt.smarttab = true


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
vim.opt.concealcursor = 'n'
vim.opt.signcolumn = 'no'

-- auto-format
vim.cmd('autocmd BufWritePre *.lua,*.py lua vim.lsp.buf.format()')
