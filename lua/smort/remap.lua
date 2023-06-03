-- ctrl BS is weird between things idk
vim.api.nvim_set_keymap('i', '<C-H>', '<C-W>', {noremap = true})

vim.g.mapleader =  " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>w", vim.cmd.w)

-- Yank into system clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>yy", "\"+Y")

-- paste from system clipboard
vim.keymap.set("n", "<leader>p", "\"+p")
vim.keymap.set("v", "<leader>p", "\"+p")
vim.keymap.set("n", "<leader>pp", "\"+P")

-- Navigate windows
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- Buffers
vim.keymap.set("n", "<left>", "<cmd>bnext<CR>")
vim.keymap.set("n", "<right>", "<cmd>bprev<CR>")
vim.keymap.set("n", "<leader>b", "<c-^>")

-- Random Navigation
vim.keymap.set("n", "<leader>p", "<c-o>")

-- Random stuff that starts or ends in INSERT
vim.keymap.set("i", "<C-BS>", "<Esc>cvb")
vim.keymap.set("n", "<CR>", "ciw")
