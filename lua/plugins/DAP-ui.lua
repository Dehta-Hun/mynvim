return {
  "rcarriga/nvim-dap-ui",
  dependencies = {
    "mfussenegger/nvim-dap",
    "nvim-neotest/nvim-nio",
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")
    require("lazydev").setup({
      library = { "nvim-dap-ui" },
    })
    -- dapui.setup()
    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
    end
    require("dapui").setup({
      layouts = {
        {
          elements = {
            "scopes",
            "stacks",
            "watches",
            "breakpoints",
          },
          -- size = 80, -- width (for left/right) or height (for top/bottom)
          size = math.floor(vim.o.columns * 1 / 3),

          position = "left",
        },
        {
          elements = {
            "repl",
            -- "console",
          },
          -- size = 16, -- height of bottom layout
          size = math.floor(vim.o.lines * 1 / 3),
          position = "bottom",
        },
      },
    })

    vim.keymap.set("n", "<leader>dc", function()
      dapui.close()
    end)
    -- dap.listeners.before.event_terminated["dapui_config"] = function()
    -- dapui.close()
    -- end
    -- dap.listeners.before.event_exited["dapui_config"] = function()
    -- dapui.close()
    -- end
  end,
}
