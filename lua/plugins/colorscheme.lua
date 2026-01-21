return {
  {
    "datsfilipe/vesper.nvim",
    lazy = false,
    config = function()
      require("vesper").setup({
        transparent = false, -- Boolean: Sets the background to transparent
        italics = {
          comments = true,   -- Boolean: Italicizes comments
          keywords = true,   -- Boolean: Italicizes keywords
          functions = true,  -- Boolean: Italicizes functions
          strings = true,    -- Boolean: Italicizes strings
          variables = true,  -- Boolean: Italicizes variables
        },
        overrides = {},      -- A dictionary of group names, can be a function returning a dictionary or a table.
        palette_overrides = {},
        -- vim.cmd.colorscheme("vesper"),
      })
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "macchiato", -- latte, frappe, macchiato, mocha
        background = {         -- :h background
          light = "latte",
          dark = "mocha",
        },
        transparent_background = false, -- disables setting the background color.
        float = {
          transparent = false,          -- enable transparent floating windows
          solid = false,                -- use solid styling for floating windows, see |winborder|
        },
        show_end_of_buffer = false,     -- shows the '~' characters after the end of buffers
        term_colors = false,            -- sets terminal colors (e.g. `g:terminal_color_0`)
        dim_inactive = {
          enabled = true,               -- dims the background color of inactive window
          shade = "dark",
          percentage = 0.01,            -- percentage of the shade to apply to the inactive window
        },
        no_italic = false,              -- Force no italic
        no_bold = false,                -- Force no bold
        no_underline = false,           -- Force no underline
        styles = {                      -- Handles the styles of general hi groups (see `:h highlight-args`):
          comments = { "italic" },      -- Change the style of comments
          conditionals = { "italic" },
          loops = {},
          functions = {},
          keywords = {},
          strings = {},
          variables = {},
          numbers = {},
          booleans = {},
          properties = {},
          types = {},
          operators = {},
          -- miscs = {}, -- Uncomment to turn off hard-coded styles
        },
        lsp_styles = { -- Handles the style of specific lsp hl groups (see `:h lsp-highlight`).
          virtual_text = {
            errors = { "italic" },
            hints = { "italic" },
            warnings = { "italic" },
            information = { "italic" },
            ok = { "italic" },
          },
          underlines = {
            errors = { "underline" },
            hints = { "underline" },
            warnings = { "underline" },
            information = { "underline" },
            ok = { "underline" },
          },
          inlay_hints = {
            background = true,
          },
        },
        color_overrides = {
          all = {
            crust = "#91d7e3",
          },
          latte = {},
          frappe = {},
          macchiato = {},
          mocha = {},
        },
        custom_highlights = {},
        default_integrations = true,
        auto_integrations = true,
        integrations = {
          diffview = true,
          fzf = true,
          mason = true,
          neotest = true,
          dap = true,
          dap_ui = true,
          telescope = {
            enabled = true,
            -- style = "nvchad",
          },
          harpoon = true,
          snacks = {
            enabled = false,
            indent_scope_color = "lavender", -- catppuccin color (eg. `lavender`) Default: text
          },
          treesitter = true,
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          notify = true,
          mini = {
            enabled = true,
            indentscope_color = "",
          },
          -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
        },
      })

      -- setup must be called before loading
      vim.cmd.colorscheme("catppuccin")
    end,
  },
}
-- return {
-- }
