return {
    "mikavilpas/yazi.nvim",
    event = "VeryLazy",
    dependencies = {
        -- check the installation instructions at
        -- https://github.com/folke/snacks.nvim
        "folke/snacks.nvim",
    },
    keys = {
        -- 👇 in this section, choose your own keymappings!
        {
            "<A-r>",
            mode = { "n", "v", "t" },
            "<cmd>Yazi toggle<cr>",
            desc = "Open yazi at the current file",
        },
        {
            -- Open in the current working directory
            "<leader>cw",
            "<cmd>Yazi cwd<cr>",
            desc = "Open the file manager in nvim's working directory",
        },
        {
            "<c-up>",
            "<cmd>Yazi toggle<cr>",
            desc = "Resume the last yazi session",
        },
    },
    opts = {
        -- if you want to open yazi instead of netrw, see below for more info
        open_for_directories = false,
        keymaps = {
            show_help = "<f1>",
        },
    },
    -- 👇 if you use `open_for_directories=true`, this is recommended
    init = function()
            -- vim.g.loaded_netrw = 1
        -- More details: https://github.com/mikavilpas/yazi.nvim/issues/802
    end,
}
