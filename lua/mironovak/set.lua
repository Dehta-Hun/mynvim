vim.opt.nu = true
vim.opt.relativenumber = true

-- little space
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.nvim/undodir"
vim.opt.undofile = true

vim.opt.incsearch = true
vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50
vim.opt.timeoutlen = 800


-- vim.opt.colorcolumn = "80"

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.mouse = "a"

vim.opt.signcolumn = "no"
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.undofile = true

vim.opt.cursorline = true
vim.cmd('let g:rnvimr_enable_picker = 1')
