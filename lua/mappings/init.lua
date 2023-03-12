vim.g.mapleader = ' '
vim.g.maplocalleader = ','
vim.keymap.set("n", "<Leader>pv", vim.cmd.Ex)
vim.keymap.set('n', '<leader>e', '<cmd>Ex<CR>')

vim.keymap.set('n', '<leader>pc', ':PackerClean<CR>')
vim.keymap.set('n', '<leader>ps', ':PackerSync<CR>')
vim.keymap.set('i', '<M-p>', '<C-r><C-o>')

vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")

vim.keymap.set("n", "<C-l>", "<C-w>l")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { silent = true })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { silent = true })

vim.keymap.set("n", "<C-Up>", ":Neorg journal tomorrow<CR>")
vim.keymap.set("n", "<C-Down>", ":Neorg journal yesterday<CR>")

vim.keymap.set("n", "<F5>", ":!Rscript -e \"rmarkdown::render('%')\"<CR>")
vim.keymap.set("n", "--", require("oil").open, { desc = "Open parent directory" })
