require("nvterm").setup({
  terminals = {
    shell = vim.o.shell,
    list = {},
    type_opts = {
      float = {
        relative = 'editor',
        row = 0.3,
        col = 0.25,
        width = 0.5,
        height = 0.4,
        border = "single",
      },
      horizontal = { location = "rightbelow", split_ratio = .3, },
      vertical = { location = "rightbelow", split_ratio = .5 },
    }
  },
  behavior = {
    autoclose_on_quit = {
      enabled = false,
      confirm = true,
    },
    close_on_exit = true,
    auto_insert = true,
  },
})
vim.keymap.set({"n", "t", "v", "x"}, "<A-i>", function ()
    require("nvterm.terminal").toggle "float"
end )
vim.keymap.set({"n", "t"}, "<leader>v", function()
    require("nvterm.terminal").new "vertical"
end)
vim.keymap.set({"n", "t"}, "<leader>t", function()
    require("nvterm.terminal").toggle "horizontal"
end)
