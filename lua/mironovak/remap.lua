vim.g.mapleader = " "
local setkey = vim.keymap.set

setkey("n", "<A-n>", vim.cmd.NvimTreeToggle)
setkey("n", "<leader>e", vim.cmd.NvimTreeFocus)
setkey("n", "K", vim.lsp.buf.hover)

-- Hide/close deapth level
setkey({ "n" }, "zo", "za")
setkey({ "n" }, "zO", "zA")

setkey({ "n", "v" }, "<Esc>", vim.cmd.noh)
setkey("v", "J", ":m '>+1<CR>gv=gv")
setkey("v", "K", ":m '<-2<CR>gv=gv")

setkey("n", "ge", vim.diagnostic.goto_next)

setkey({ "n", "v" }, "<C-h>", "<C-w>h")
setkey({ "n", "v" }, "<C-l>", "<C-w>l")
setkey({ "n", "v" }, "<C-k>", "<C-w>k")
setkey({ "n", "v" }, "<C-j>", "<C-w>j")

setkey({ "n", "v" }, "<A-h>", "<C-w><")
setkey({ "n", "v" }, "<A-l>", "<C-w>>")
setkey({ "n", "v" }, "<A-k>", "<C-w>+")
setkey({ "n", "v" }, "<A-j>", "<C-w>-")
-- easy move from terminal
setkey("t", "<C-h>", "<C-\\><C-n><C-w>h")
setkey("t", "<C-l>", "<C-\\><C-n><C-w>l")
setkey("t", "<C-k>", "<C-\\><C-n><C-w>k")
setkey("t", "<C-j>", "<C-\\><C-n><C-w>j")
setkey("t", "<Esc>", "<C-\\><C-n>")

setkey("n", "<C-d>", "<C-d>zz")
setkey("n", "<C-u>", "<C-u>zz")
setkey("n", "G", "Gzz")

setkey("n", "n", "nzzzv")
setkey("n", "N", "Nzzzv")
setkey("n", "J", "mzJ`z")

-- greatest remap ever
setkey("x", "<leader>p", [["_dP]])
setkey({ "n", "v" }, "<leader>d", [["_d]])

-- copy to clipboard
setkey("v", "<C-c>", '"+y')

-- buffers
setkey("n", "<C-n>", vim.cmd.bnext)
setkey("n", "<C-p>", vim.cmd.bprev)

-- Ranger toggle
-- setkey({ "n", "t", "v" }, "<A-r>", vim.cmd.RnvimrToggle)

setkey("n", "<leader>r", vim.lsp.buf.rename, bufopts)


local buffdelete = function()
	vim.cmd.bdelete()
	vim.cmd.bnext()
end
setkey("n", "<leader>bd", buffdelete)
