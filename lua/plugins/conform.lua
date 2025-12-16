return {
  "stevearc/conform.nvim",
  opts = {},
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        -- sh = {
        --     "beautysh",
        -- },
        -- zsh = {
        --     "beautysh",
        -- },
        python = {
          -- To fix auto-fixable lint errors.
          -- "ruff_fix",
          -- To run the Ruff formatter.
          -- "ruff_format",
          -- To organize the imports.
          "ruff_organize_imports",
        },
      },
      vim.keymap.set("", "<leader>gq", function()
        require("conform").format({ async = true, lsp_fallback = true })
      end, { desc = "[F]ormat with Conform" }),

      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = { "*.py" },
        callback = function(args)
          require("conform").format({ bufnr = args.buf })
        end,
      }),
    })
  end,
}
