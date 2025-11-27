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
    local actions = require("fzf-lua").actions
    require("fzf-lua").setup({
      -- Global toggle variable
      { "telescope", "fzf-native" },
      winopts = {
        height = 0.4, -- dropdown height
        width = 0.6,  -- dropdown width
        row = 0.4,    -- center vertically
        col = 0.5,    -- center horizontally
        border = "single",
        fullscreen = true,
        preview = {
          hidden = false, -- disable preview like dropdown
        },
      },
      actions = {
        -- Below are the default actions, setting any value in these tables will override
        -- the defaults, to inherit from the defaults change [1] from `false` to `true`
        toggle_case_flag = "--smart-case",
        files = {
          -- true,        -- uncomment to inherit all the below in your custom config
          -- Pickers inheriting these actions:
          --   files, git_files, git_status, grep, lsp, oldfiles, quickfix, loclist,
          --   tags, btags, args, buffers, tabs, lines, blines
          -- `file_edit_or_qf` opens a single selection or sends multiple selection to quickfix
          -- replace `enter` with `file_edit` to open all files/bufs whether single or multiple
          -- replace `enter` with `file_switch_or_edit` to attempt a switch in current tab first
          ["enter"] = actions.file_edit_or_qf,
          ["ctrl-o"] = actions.toggle_case,
          ["ctrl-s"] = actions.file_split,
          ["ctrl-v"] = actions.file_vsplit,
          -- ["ctrl-t"] = actions.file_tabedit,
          ["alt-q"] = actions.file_sel_to_qf,
          -- ["alt-Q"] = actions.file_sel_to_ll,
          -- ["alt-i"] = actions.toggle_ignore,
          -- ["alt-h"] = actions.toggle_hidden,
          -- ["alt-f"] = actions.toggle_follow,
        },
      },
      files = {
        previewer = "bat", -- uncomment to override previewer
        -- (name from 'previewers' table)
        -- set to 'false' to disable
        prompt = "Files❯ ",
        multiprocess = true, -- run command in a separate process
        git_icons = true,    -- show git icons?
        file_icons = true,   -- show file icons (true|"devicons"|"mini")?
        color_icons = true,  -- colorize file|git icons
        -- path_shorten   = 1,              -- 'true' or number, shorten path?
        -- Uncomment for custom vscode-like formatter where the filename is first:
        -- e.g. "fzf-lua/previewer/fzf.lua" => "fzf.lua previewer/fzf-lua"
        -- formatter      = "path.filename_first",
        -- executed command priority is 'cmd' (if exists)
        -- otherwise auto-detect prioritizes `fd`:`rg`:`find`
        -- default options are controlled by 'fd|rg|find|_opts'
        -- cmd            = "rg --files",
        find_opts = [[-type f \! -path '*/.git/*']],
        rg_opts = [[--color=never --hidden --files -g "!.git" -g "!**__pycache__/*"]],
        fd_opts = [[--color=never --hidden --type f --type l --exclude .git --exclude "__pycache__"]],
        dir_opts = [[/s/b/a:-d]],
        -- by default, cwd appears in the header only if {opts} contain a cwd
        -- parameter to a different folder than the current working directory
        -- uncomment if you wish to force display of the cwd as part of the
        -- query prompt string (fzf.vim style), header line or both
        -- cwd_header = true,
        cwd_prompt = true,
        cwd_prompt_shorten_len = 32,        -- shorten prompt beyond this length
        cwd_prompt_shorten_val = 1,         -- shortened path parts length
        toggle_ignore_flag = "--no-ignore", -- flag toggled in `actions.toggle_ignore`
        toggle_hidden_flag = "--hidden",    -- flag toggled in `actions.toggle_hidden`
        toggle_follow_flag = "-L",          -- flag toggled in `actions.toggle_follow`
        hidden = true,                      -- enable hidden files by default
        follow = false,                     -- do not follow symlinks by default
        no_ignore = true,                   -- respect ".gitignore"  by default
        actions = {
          -- inherits from 'actions.files', here we can override
          -- or set bind to 'false' to disable a default action
          -- uncomment to override `actions.file_edit_or_qf`
          ["enter"] = actions.file_edit,
          -- custom actions are available too
          --   ["ctrl-y"]    = function(selected) print(selected[1]) end,
        },
      },
      grep = {
        prompt = "Rg❯ ",
        input_prompt = "Grep For❯ ",
        multiprocess = true, -- run command in a separate process
        git_icons = false,   -- show git icons?
        file_icons = true,   -- show file icons (true|"devicons"|"mini")?
        color_icons = true,  -- colorize file|git icons
        -- executed command priority is 'cmd' (if exists)
        -- otherwise auto-detect prioritizes `rg` over `grep`
        -- default options are controlled by 'rg|grep_opts'
        -- cmd            = "rg --vimgrep",
        hidden = false,    -- disable hidden files by default
        -- toggle_case_flag = "--smart-case",
        follow = false,    -- do not follow symlinks by default
        no_ignore = false, -- respect ".gitignore"  by default
        -- Uncomment to use the rg config file `$RIPGREP_CONFIG_PATH`
        -- RIPGREP_CONFIG_PATH = vim.env.RIPGREP_CONFIG_PATH,
        --
        -- Set to 'true' to always parse globs in both 'grep' and 'live_grep'
        -- search strings will be split using the 'glob_separator' and translated
        -- to '--iglob=' arguments, requires 'rg'
        -- can still be used when 'false' by calling 'live_grep_glob' directly
        rg_glob = true,            -- default to glob parsing with `rg`
        glob_flag = "--iglob",     -- for case sensitive globs use '--glob'
        glob_separator = "%s%-%-", -- query separator pattern (lua): ' --'
        -- advanced usage: for custom argument parsing define
        -- 'rg_glob_fn' to return a pair:
        --   first returned argument is the new search query
        --   second returned argument are additional rg flags
        -- rg_glob_fn = function(query, opts)
        --   ...
        --   return new_query, flags
        -- end,
        --
        -- Enable with narrow term width, split results to multiple lines
        -- NOTE: multiline requires fzf >= v0.53 and is ignored otherwise
        -- multiline      = 1,      -- Display as: PATH:LINE:COL\nTEXT
        -- multiline      = 2,      -- Display as: PATH:LINE:COL\nTEXT\n
        actions = {
          ["ctrl-o"] = actions.toggle_case,
          -- actions inherit from 'actions.files' and merge
          -- this action toggles between 'grep' and 'live_grep'
          ["ctrl-g"] = { actions.grep_lgrep },
          -- uncomment to enable '.gitignore' toggle for grep
          ["ctrl-r"] = { actions.toggle_ignore },
          -- ["ctrl-c"] = { actions.toggle_case },
        },
        no_header = false,   -- hide grep|cwd header?
        no_header_i = false, -- hide interactive header?
      },
    })
    keymap("n", "<leader>fzf", fzf.grep, opts)
    keymap("n", "<leader>fb", fzf.buffers, opts)
    keymap("n", "<leader>ff", fzf.files, opts)
    keymap("n", "<leader>fg", fzf.grep_curbuf, opts)
  end,
}
