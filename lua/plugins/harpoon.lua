return {
  "ThePrimeagen/harpoon",
  lazy = false,
  branch = "harpoon2",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local harpoon = require("harpoon")
    harpoon:setup({
      settings = {
        save_on_toggle = true,
        sync_on_ui_close = true,
      },
    })

    vim.keymap.set("n", "<leader>ha", function()
      harpoon:list():add()
    end)
    vim.keymap.set("n", "<leader>hh", function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end)
  end,
}
