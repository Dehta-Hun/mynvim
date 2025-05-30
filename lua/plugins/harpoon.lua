return {
    "ThePrimeagen/harpoon",
    -- lazy = true,
    config = function()
        local mark = require("harpoon.mark")
        local ui = require("harpoon.ui")

        vim.keymap.set("n", "<leader>ha", mark.add_file)
        vim.keymap.set("n", "<leader>hh", ui.toggle_quick_menu)
    end,
}
