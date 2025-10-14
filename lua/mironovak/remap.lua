vim.g.mapleader = " "

-- vim.cmd.MiniFiles.open)
vim.keymap.set("n", "<leader>sd", vim.diagnostic.open_float, opts) -- show diagnostics for line
-- Hide/close deapth level
vim.keymap.set({ "n" }, "zo", "za")
vim.keymap.set({ "n" }, "zO", "zA")

vim.keymap.set({ "n", "v" }, "<Esc>", vim.cmd.noh)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "ge", function()
    vim.diagnostic.jump({ count = -1, float = true })
end)

-- vim.keymap.set({ "n", "v" }, "<C-h>", "<C-w>h")
-- vim.keymap.set({ "n", "v" }, "<C-l>", "<C-w>l")
-- vim.keymap.set({ "n", "v" }, "<C-k>", "<C-w>k")
-- vim.keymap.set({ "n", "v" }, "<C-j>", "<C-w>j")

vim.keymap.set({ "n", "v" }, "<A-h>", "<C-w><")
vim.keymap.set({ "n", "v" }, "<A-l>", "<C-w>>")
vim.keymap.set({ "n", "v" }, "<A-k>", "<C-w>+")
vim.keymap.set({ "n", "v" }, "<A-j>", "<C-w>-")
-- easy move from terminal
vim.keymap.set("t", "<C-h>", "<C-\\><C-n><C-w>h")
vim.keymap.set("t", "<C-l>", "<C-\\><C-n><C-w>l")
vim.keymap.set("t", "<C-k>", "<C-\\><C-n><C-w>k")
vim.keymap.set("t", "<C-j>", "<C-\\><C-n><C-w>j")
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

vim.keymap.set("i", "<C-Right>", "<Esc>ea")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "G", "Gzz")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "J", "mzJ`z")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- copy to clipboard
vim.keymap.set("v", "<C-c>", '"+y')

-- buffers
vim.keymap.set("n", "<C-n>", vim.cmd.bnext)
vim.keymap.set("n", "<C-p>", vim.cmd.bprev)

vim.keymap.set("v", "$", "g_")
local buffdelete = function()
    vim.cmd.bdelete()
    vim.cmd.bnext()
end
vim.keymap.set("n", "<leader>bd", buffdelete)

--lsp keybinds
vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
vim.keymap.set("n", "K", vim.lsp.buf.hover)
vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, bufopts)
vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, bufopts)

--git
local open_buf_dif = function()
    vim.cmd.windo("diffthis")
end
vim.keymap.set({ "n" }, "<leader>GDB", open_buf_dif)
vim.keymap.set({ "n" }, "<leader>GDC", vim.cmd.diffoff)

-- Debug
vim.keymap.set("n", "<leader>db", vim.cmd.DapToggleBreakpoint, bufopts)
vim.keymap.set("n", "<leader>do", function()
    vim.cmd.Neotest("output-panel")
end)
-- vim.keymap.set("n", "<leader>dr", function()
-- require("neotest").run.run({ strategy = "dap" })
-- end)
vim.keymap.set("n", "gq", vim.lsp.buf.format, {})
