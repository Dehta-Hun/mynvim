return {
	"sindrets/diffview.nvim",
	lazy = false,
	config = function()
		vim.keymap.set("n", "<leader>gD", vim.cmd.DiffviewOpen)
	end,
}
