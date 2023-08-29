vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("n", "<C-n>", vim.cmd.NvimTreeToggle)
vim.keymap.set("n", "<leader>e", vim.cmd.NvimTreeFocus)

vim.keymap.set({"n", "v"}, "<Esc>", vim.cmd.noh)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set({"n", "v"}, "<C-h>", "<C-w>h")
vim.keymap.set({"n", "v"}, "<C-l>", "<C-w>l")
vim.keymap.set({"n", "v"}, "<C-k>", "<C-w>k")
vim.keymap.set({"n", "v"}, "<C-j>", "<C-w>j")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "G", "Gzz")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "J", "mzJ`z")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])


vim.keymap.set("t", "<C-x>", "<C-\\><C-n>")
