local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({

{
  "Dehta-Hun/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
  config = function()
      vim.cmd[[colorscheme tokyonight]]
  end,
},
{
    'williamboman/mason-lspconfig.nvim',
    lazy = false,
    priority = 999,
},
{
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
},

{
    'nvim-telescope/telescope.nvim',
    lazy = false,
    dependencies = {
        'nvim-lua/plenary.nvim',
    },
},

{
    'nvim-treesitter/nvim-treesitter',
  lazy = false,
    config = function()
        vim.cmd[[TSUpdate]]
    end,
},

{   'ThePrimeagen/harpoon', lazy = false,},
{   'mbbill/undotree', lazy = false,},
{   'tpope/vim-fugitive', lazy = false,},
{
    'VonHeikemen/lsp-zero.nvim',
    lazy = false,
    dependencies = {
    -- Autocompletion
    {'hrsh7th/nvim-cmp'},     -- Required
    {'hrsh7th/cmp-nvim-lsp'}, -- Required
    {'L3MON4D3/LuaSnip'},     -- Required
},
{
    'neovim/nvim-lspconfig',
    lazy = false,
    priority = 998,
},
{
    'williamboman/mason.nvim',
    lazy = false,
  config = function()
      require("mason").setup()
  end,

},           -- Optional
},
{   'nvim-lualine/lualine.nvim', lazy = false,},
{   'NvChad/nvterm', lazy = false,},
{   'xiyaowong/transparent.nvim', lazy = false,},
{   'Aasim-A/scrollEOF.nvim',lazy = false,},
{
    'nvim-tree/nvim-tree.lua',
    lazy = false,
    dependencies = {
        'nvim-tree/nvim-web-devicons',
    },
},
{   'brenoprata10/nvim-highlight-colors', lazy = false,},
{   'christoomey/vim-tmux-navigator', lazy = false,},
{   'stevearc/dressing.nvim', lazy = false,},
{
    'hrsh7th/nvim-cmp',
    lazy = false,
    dependencies = {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'hrsh7th/nvim-cmp',
        'L3MON4D3/LuaSnip',
        'saadparwaiz1/cmp_luasnip',
    },
},



})
