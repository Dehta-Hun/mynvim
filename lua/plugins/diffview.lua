return {
	"sindrets/diffview.nvim",
	lazy = false,
	config = function()
		vim.keymap.set("n", "<leader>gd", vim.cmd.DiffviewOpen)
	end,
}
