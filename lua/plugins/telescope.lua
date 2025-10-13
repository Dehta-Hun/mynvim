return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        local builtin = require("telescope.builtin")
        local utils = require("telescope.utils")
        local custom_pickers = require("plugins.addons.telescope_custom_pickers")
        local keymap = vim.keymap.set
        local opts = { noremap = true, silent = true }
        require("telescope").setup({
            extensions = {
                fzf = {
                    fuzzy = true,    -- false will only do exact matching
                    override_generic_sorter = true, -- override the generic sorter
                    override_file_sorter = true, -- override the file sorter
                    case_mode = "smart_case", -- or "ignore_case" or "respect_case"
                    -- the default case_mode is "smart_case"
                },
            },
            defaults = {
                layout_config = {
                    horizontal = { width = 0.99 },
                },
                vimgrep_arguments = {
                    "rg",
                    "--color=never",
                    "-uu",
                    "--no-heading",
                    "--with-filename",
                    "--line-number",
                    "--column",
                    "--smart-case",
                    "--glob=!**/.git/*",
                    "--glob=!**__pycache__/*",
                },
            },
            pickers = {
                find_files = {
                    hidden = true,
                    find_command = {
                        "rg",
                        "--files",
                        "--color=never",
                        "-uu",
                        "--no-heading",
                        "--with-filename",
                        "--line-number",
                        "--column",
                        "--smart-case",
                        "--glob=!**/.git/*",
                        "--glob=!**__pycache__/*",
                    },
                },
                live_grep = {
                    -- path_display = { "shorten" },
                    mappings = {
                        i = {
                            ["<c-f>"] = custom_pickers.actions.set_extension,
                            ["<c-l>"] = custom_pickers.actions.set_folders,
                        },
                    },
                },
            },
        })

        require("telescope").load_extension("fzf")

        function vim.getVisualSelection()
            vim.cmd('noau normal! "vy"')
            local text = vim.fn.getreg("v")
            vim.fn.setreg("v", {})

            text = string.gsub(text, "\n", "")
            if #text > 0 then
                return text
            else
                return ""
            end
        end

        -- keymap("n", "<leader>ff", builtin.find_files, {})
        keymap("v", "<leader>ff", function()
            local text = vim.getVisualSelection()
            builtin.find_files({ default_text = text })
        end, opts)

        keymap("n", "<leader>fs", builtin.live_grep, {})
        keymap("v", "<leader>fs", function()
            local text = vim.getVisualSelection()
            builtin.live_grep({ default_text = text })
        end, opts)

        -- keymap("n", "<leader>fb", builtin.buffers, {})

        keymap("n", "<leader>fh", builtin.help_tags, {})

        -- keymap("n", "<leader>fz", builtin.current_buffer_fuzzy_find, {})
        keymap("v", "<leader>fz", function()
            local text = vim.getVisualSelection()
            builtin.current_buffer_fuzzy_find({ default_text = text })
        end, opts)
        vim.keymap.set("n", "<leader>fc", function()
            builtin.find_files({ cwd = utils.buffer_dir() })
        end, { desc = "Find files in current working directory" })

        keymap("n", "<leader>fd", function()
            builtin.diagnostics({ bufnr = 0 })
        end, {})
    end,
}
