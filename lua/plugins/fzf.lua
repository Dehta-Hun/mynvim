return {
    "ibhagwan/fzf-lua",
    lazy = false,
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    -- or if using mini.icons/mini.nvim
    -- dependencies = { "echasnovski/mini.icons" },
    opts = {},
    config = function()
        local keymap = vim.keymap.set
        local fzf = require("fzf-lua")
        require("fzf-lua").setup({
            { "telescope", "fzf-native" },
            winopts = {
                height = 0.4, -- dropdown height
                width = 0.6, -- dropdown width
                row = 0.4, -- center vertically
                col = 0.5, -- center horizontally
                border = "single",
                fullscreen = true,
                preview = {
                    hidden = false, -- disable preview like dropdown
                },
            },
        })
        keymap("n", "<leader>fb", fzf.buffers, opts)
        keymap("n", "<leader>ff", fzf.files, opts)
        keymap("n", "<leader>fs", fzf.live_grep, opts)
        keymap("n", "<leader>fz", fzf.grep_curbuf, opts)
    end,
}
