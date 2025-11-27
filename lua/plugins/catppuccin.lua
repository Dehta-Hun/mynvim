return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "mocha",
      integrations = {
        native_lsp = {
          enabled = true,
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
        cmp = true,
        gitsigns = true,
        notify = true,
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
        nvimtree = true,
        snacks = {
          enabled = false,
          indent_scope_color = "", -- catppuccin color (eg. `lavender`) Default: text
        },
        treesitter = true,
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
    })
    vim.cmd("colorscheme catppuccin")
  end,
}
