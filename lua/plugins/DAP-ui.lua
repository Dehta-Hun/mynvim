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
                        "breakpoints",
                        "stacks",
                        "watches",
                        -- "console",
                    },
                    size = 40, -- width (for left/right) or height (for top/bottom)
                    position = "left",
                },
                {
                    elements = {
                        "repl",
                    },
                    size = 10, -- height of bottom layout
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
