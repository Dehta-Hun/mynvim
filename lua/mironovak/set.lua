-- vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
vim.opt.smartindent = false
vim.opt.autoindent = false
vim.o.autoread = true

vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.o.winborder = "rounded"

-- vim.o.foldmethod = "expr"
-- vim.o.foldexpr = "nvim_treesitter#foldexpr()"

-- Enable showing inline diagnositc
vim.diagnostic.config({ virtual_text = true, severity_sort = true })

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.nvim/undodir"
vim.opt.undofile = true
vim.opt.colorcolumn = "120"

vim.opt.incsearch = true
vim.opt.termguicolors = true

vim.opt.mouse = "nv"
vim.opt.mousemodel = "extend"
vim.opt.signcolumn = "yes"
vim.opt.scrolloff = 8
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50
vim.opt.timeoutlen = 800

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.formatoptions = "croq"

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.cursorline = true
-- vim.cmd("let g:rnvimr_enable_picker = 1")

vim.filetype.add({
  extension = {
    bpt = "xml", -- treat bpt as xml
  },
  filename = {
    ["docker-compose.yaml"] = "yaml.docker-compose",
    ["docker-compose.yml"] = "yaml.docker-compose",
  },
  pattern = {
    [".*ansible(.*/?)%w*.ya?ml"] = "yaml.ansible", -- treat ansible directory as ansible playbooks
  },
})
vim.api.nvim_create_autocmd("BufWritePost", {
  callback = function()
    local buf = 0
    local path = vim.api.nvim_buf_get_name(buf):match(".*/test_jsons/.+%.json$")

    if not path then
      return
    end

    -- run formatter
    os.execute(string.format("python ~/Corp-FWaaS/test/tools/json_format.py format %q", path))

    -- reload WITHOUT killing undo
    vim.cmd("silent! noautocmd undojoin | edit!")
  end,
})
-- RSync repo to testmachine
-- vim.api.nvim_create_autocmd("BufWritePost", {
--     callback = function()
--         local path = vim.api.nvim_buf_get_name(0):match(".*Corp.FWaaS.*")
--         if path then
--             os.execute(
--                 'tmux new-session -d "rsync -aP ~/Corp-FWaaS qc-fwaas-manual-kvm-mironov-2.avp.ru: > /dev/null 2>&1"'
--             )
--         end
--     end,
-- })
