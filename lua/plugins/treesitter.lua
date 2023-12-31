return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	config = function()
		require("nvim-treesitter.configs").setup({
			-- ensure_installed = { all },
			sync_install = true,
			auto_install = true,
			ignore_install = {},
			highlight = {
				enable = true,
			},
		})
	end,
}
