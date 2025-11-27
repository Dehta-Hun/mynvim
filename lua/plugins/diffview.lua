return {
  "sindrets/diffview.nvim",
  lazy = false,
  config = function ()
    vim.keymap.set("n", "<leader>GDD", vim.cmd.DiffviewOpen)
  end,
}
