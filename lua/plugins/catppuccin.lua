return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			flavour = "macchiato",
			integrations = {
				cmp = true,
                gitsigns = true,
                notify = true,
				telescope = {
					enabled = true,
					style = "nvchad",
				},
				harpoon = true,
				nvimtree = true,
				treesitter = true,
			},
			color_overrides = {
				all = {
					crust = "#91d7e3",
				},
				latte = {},
				frappe = {},
				macchiato = {},
				mocha = {},
			},
		})
			vim.cmd("colorscheme catppuccin")
	end,
}
