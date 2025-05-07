return {
    "tinted-theming/tinted-vim",
    -- "tinted-theming/schemes",
    -- name = "catppuccin",
    priority = 1000,
    config = function()
        vim.cmd.colorscheme("base16-horizon-dark")
        -- require("tinted-vim").setup({
        -- })
    end,
    -- vim.cmd("colorscheme onedark")
}
