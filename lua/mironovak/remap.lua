vim.g.mapleader = " "
local setkey = vim.keymap.set

    -- vim.cmd.MiniFiles.open)
-- setkey("n", "<leader>e", vim.cmd.NvimTreeFocus)
setkey("n", "<leader>sd", vim.diagnostic.open_float, opts) -- show diagnostics for line
-- Hide/close deapth level
setkey({ "n" }, "zo", "za")
setkey({ "n" }, "zO", "zA")

setkey({ "n", "v" }, "<Esc>", vim.cmd.noh)
setkey("v", "J", ":m '>+1<CR>gv=gv")
setkey("v", "K", ":m '<-2<CR>gv=gv")

setkey("n", "ge", function()
	vim.diagnostic.jump({ count = -1, float = true })
end)

-- setkey({ "n", "v" }, "<C-h>", "<C-w>h")
-- setkey({ "n", "v" }, "<C-l>", "<C-w>l")
-- setkey({ "n", "v" }, "<C-k>", "<C-w>k")
-- setkey({ "n", "v" }, "<C-j>", "<C-w>j")

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

setkey("i", "<C-Right>", "<Esc>ea")

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

setkey("v", "$", "g_")
local buffdelete = function()
	vim.cmd.bdelete()
	vim.cmd.bprev()
end
setkey("n", "<leader>bd", buffdelete)

--lsp keybinds
setkey({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
setkey("n", "K", vim.lsp.buf.hover)
setkey("n", "<leader>r", vim.lsp.buf.rename, bufopts)
setkey("n", "<leader>gd", vim.lsp.buf.definition, bufopts)

--git
local open_buf_dif = function()
	vim.cmd.NvimTreeClose()
	vim.cmd.windo("diffthis")
end
setkey({ "n" }, "<leader>DB", open_buf_dif)
setkey({ "n" }, "<leader>DC", vim.cmd.diffoff)

-- Debug
setkey("n", "<leader>db", vim.cmd.DapToggleBreakpoint, bufopts)
setkey("n", "<leader>do", function()
	vim.cmd.Neotest("output-panel")
end)
setkey("n", "<leader>dr", function()
	require("neotest").run.run({ strategy = "dap" })
end)
setkey("n", "gq", vim.lsp.buf.format, {})
