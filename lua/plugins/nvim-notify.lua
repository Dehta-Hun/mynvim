return {
  "rcarriga/nvim-notify",
  lazy = false,
  config = function()
    require("notify").setup({
      max_width = 50,
      max_height = 5,
      merge_duplicates = true,
    })
    local banned_messages = { "All parsers are up-to-date!" }
    ---@diagnostic disable-next-line: duplicate-set-field
    vim.notify = function(msg, ...)
      for _, banned in ipairs(banned_messages) do
        if msg == banned then
          return
        end
      end
      require("notify")(msg, ...)
    end
  end,
}
