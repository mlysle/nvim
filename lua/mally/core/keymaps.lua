vim.g.mapleader = ' '
vim.g.maplocalleader = ','

local map = vim.keymap.set

map("n", "<Leader>pv", vim.cmd.Ex)
map('n', '<leader>e', '<cmd>Ex<CR>')

map('i', 'jk', '<ESC>')
map('i', 'kj', '<ESC>')

map('i', '<M-p>', '<C-r><C-o>')

map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")

map("n", "<C-l>", "<C-w>l")

map("v", "J", ":m '>+1<CR>gv=gv", { silent = true })
map("v", "K", ":m '<-2<CR>gv=gv", { silent = true })

map("n", "<C-Up>", ":Neorg journal tomorrow<CR>")
map("n", "<C-Down>", ":Neorg journal yesterday<CR>")

map("n", "<F5>", ":!Rscript -e \"rmarkdown::render('%')\"<CR>")
--map("n", "<Leader>h", ":ClangdSwitchSourceHeader<CR>")
