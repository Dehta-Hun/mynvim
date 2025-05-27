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
            files = {
                previewer = "bat", -- uncomment to override previewer
                -- (name from 'previewers' table)
                -- set to 'false' to disable
                prompt = "Files❯ ",
                multiprocess = true, -- run command in a separate process
                git_icons = true, -- show git icons?
                file_icons = true, -- show file icons (true|"devicons"|"mini")?
                color_icons = true, -- colorize file|git icons
                -- path_shorten   = 1,              -- 'true' or number, shorten path?
                -- Uncomment for custom vscode-like formatter where the filename is first:
                -- e.g. "fzf-lua/previewer/fzf.lua" => "fzf.lua previewer/fzf-lua"
                -- formatter      = "path.filename_first",
                -- executed command priority is 'cmd' (if exists)
                -- otherwise auto-detect prioritizes `fd`:`rg`:`find`
                -- default options are controlled by 'fd|rg|find|_opts'
                -- cmd            = "rg --files",
                find_opts = [[-type f \! -path '*/.git/*']],
                rg_opts = [[--color=never --hidden --files -g "!.git"]],
                fd_opts = [[--color=never --hidden --type f --type l --exclude .git]],
                dir_opts = [[/s/b/a:-d]],
                -- by default, cwd appears in the header only if {opts} contain a cwd
                -- parameter to a different folder than the current working directory
                -- uncomment if you wish to force display of the cwd as part of the
                -- query prompt string (fzf.vim style), header line or both
                -- cwd_header = true,
                cwd_prompt = true,
                cwd_prompt_shorten_len = 32, -- shorten prompt beyond this length
                cwd_prompt_shorten_val = 1, -- shortened path parts length
                toggle_ignore_flag = "--no-ignore", -- flag toggled in `actions.toggle_ignore`
                toggle_hidden_flag = "--hidden", -- flag toggled in `actions.toggle_hidden`
                toggle_follow_flag = "-L", -- flag toggled in `actions.toggle_follow`
                hidden = true,          -- enable hidden files by default
                follow = false,         -- do not follow symlinks by default
                no_ignore = true,       -- respect ".gitignore"  by default
                actions = {
                    -- inherits from 'actions.files', here we can override
                    -- or set bind to 'false' to disable a default action
                    -- uncomment to override `actions.file_edit_or_qf`
                    --   ["enter"]     = actions.file_edit,
                    -- custom actions are available too
                    --   ["ctrl-y"]    = function(selected) print(selected[1]) end,
                },
            },
        })
        keymap("n", "<leader>fb", fzf.buffers, opts)
        keymap("n", "<leader>ff", fzf.files, opts)
        keymap("n", "<leader>fs", fzf.live_grep, opts)
        keymap("n", "<leader>fz", fzf.grep_curbuf, opts)
    end,
}
