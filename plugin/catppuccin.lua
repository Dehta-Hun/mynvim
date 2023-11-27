require("catppuccin").setup {
    integrations = {
        cmp = true,
        telescope = {
            enabled = true,
            style = "nvchad"
        },
        harpoon = true,
        nvimtree = true,
        treesitter = true,
    },
    color_overrides = {
        all = {
            crust = "#91d7e3",
        },
        latte = {
        },
        frappe = {},
        macchiato = {},
        mocha = {},
    }
}
vim.cmd('colorscheme catppuccin')
