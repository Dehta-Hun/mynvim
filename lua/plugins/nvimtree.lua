return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  lazy = false,
  -- set termguicolors to enable highlight groups
  -- local api = require("nvim-tree.api")

  -- local function opts(desc)
  -- 	return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  -- end
  --
  -- -- default mappings
  -- api.config.mappings.default_on_attach(bufnr)
  --
  -- -- custom mappings
  -- vim.keymap.set("n", "<C-t>", api.tree.change_root_to_parent, opts("Up")),
  -- vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help")),
  --
  config = function()
    vim.opt.termguicolors = true
    require("nvim-tree").setup({
      vim.keymap.set("n", "<A-n>", vim.cmd.NvimTreeToggle),
      vim.keymap.set("n", "<leader>e", vim.cmd.NvimTreeFocus),
      sort_by = "case_sensitive",
      filters = {
        dotfiles = false,
        git_ignored = false,
        custom = { "^.git$" },
        --    exclude = { vim.fn.stdpath "config" .. "/lua/custom" },
      },
      disable_netrw = true,
      hijack_netrw = true,
      hijack_cursor = true,
      hijack_unnamed_buffer_when_opening = false,
      sync_root_with_cwd = true,
      update_focused_file = {
        enable = true,
        update_root = true,
      },
      view = {
        adaptive_size = true,
        relativenumber = true,
        cursorline = true,
        number = true,
        side = "left",
        width = {
          max = 44,
          min = 20,
        },
        signcolumn = "no",
        preserve_window_proportions = true,
      },
      git = {
        enable = true,
        ignore = true,
        timeout = 1000,
      },
      filesystem_watchers = {
        enable = true,
      },
      actions = {
        open_file = {
          resize_window = true,
        },
      },
      renderer = {
        root_folder_label = false,
        highlight_git = true,
        highlight_opened_files = "all",
        indent_width = 1,
        indent_markers = {
          enable = true,
          inline_arrows = false,
        },

        icons = {
          show = {
            file = true,
            folder = true,
            folder_arrow = true,
            git = true,
            diagnostics = true,
          },

          glyphs = {
            default = "󰈚",
            symlink = "",
            folder = {
              default = "",
              empty = "",
              empty_open = "",
              open = "",
              symlink = "",
              symlink_open = "",
              arrow_open = "",
              arrow_closed = "",
            },
            git = {
              unstaged = "✗",
              staged = "✓",
              unmerged = "",
              renamed = "➜",
              untracked = "★",
              deleted = "",
              ignored = "◌",
            },
          },
        },
      },
    })
  end,
}
