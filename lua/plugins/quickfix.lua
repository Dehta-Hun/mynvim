return {
  {
    "kevinhwang91/nvim-bqf",
    lazy = false,
    ft = "qf",
  },
  {
    "stevearc/quicker.nvim",
    -- ft = "qf",
    config = function()
      require("quicker").setup({
        opts = { relativenumber = true },
      })
    end,
  },
}
