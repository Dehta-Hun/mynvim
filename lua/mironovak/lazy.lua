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
        "catppuccin/nvim",
        lazy = false,
        name = "catppuccin",
        priority = 1000,
        config = function()
        end,
    },
    {
        'mhartington/formatter.nvim',
        config = function ()
        end
    },
    {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup {
                signs                        = {
                    add          = { text = '│' },
                    change       = { text = '│' },
                    delete       = { text = '_' },
                    topdelete    = { text = '‾' },
                    changedelete = { text = '~' },
                    untracked    = { text = '┆' },
                },
                signcolumn                   = true,  -- Toggle with `:Gitsigns toggle_signs`
                numhl                        = false, -- Toggle with `:Gitsigns toggle_numhl`
                linehl                       = false, -- Toggle with `:Gitsigns toggle_linehl`
                word_diff                    = false, -- Toggle with `:Gitsigns toggle_word_diff`
                watch_gitdir                 = {
                    follow_files = true
                },
                attach_to_untracked          = true,
                current_line_blame           = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
                current_line_blame_opts      = {
                    virt_text = true,
                    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
                    delay = 1000,
                    ignore_whitespace = false,
                },
                current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
                sign_priority                = 6,
                update_debounce              = 100,
                status_formatter             = nil,   -- Use default
                max_file_length              = 40000, -- Disable if file is longer than this (in lines)
                preview_config               = {
                    -- Options passed to nvim_open_win
                    border = 'single',
                    style = 'minimal',
                    relative = 'cursor',
                    row = 0,
                    col = 1
                },
                yadm                         = {
                    enable = false
                },
            }
        end
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
            vim.cmd [[TSUpdate]]
        end,
    },

    { 'ThePrimeagen/harpoon', lazy = true, },
    { 'mbbill/undotree',      lazy = false, },
    { 'tpope/vim-fugitive',   lazy = false, },
    {
        'VonHeikemen/lsp-zero.nvim',
        lazy = false,
        dependencies = {
            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },     -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'L3MON4D3/LuaSnip' },     -- Required
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

        }, -- Optional

        {
            'kevinhwang91/rnvimr',
            lazy = false,
        },

    },
    { 'nvim-lualine/lualine.nvim',  lazy = false, },
    { 'NvChad/nvterm',              lazy = false, },
    { 'xiyaowong/transparent.nvim', lazy = false, },
    { 'Aasim-A/scrollEOF.nvim',     lazy = false, },
    {
        'nvim-tree/nvim-tree.lua',
        lazy = false,
        dependencies = {
            'nvim-tree/nvim-web-devicons',
        },
    },
    { 'brenoprata10/nvim-highlight-colors', lazy = false, },
    { 'christoomey/vim-tmux-navigator',     lazy = false, },
    { 'stevearc/dressing.nvim',             lazy = false, },
    { 'simrat39/rust-tools.nvim',           lazy = false, },
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
