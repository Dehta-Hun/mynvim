return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	lazy = false,
	config = function()
		require("lualine").setup({
			options = {
				always_divide_middle = true,
				-- ... your lualine config
				globalstatus = true,
				-- theme = 'tokyonight',
				-- ... your lualine config
			},
			sections = {
				lualine_x = { "searchcount", "filetype" },
				lualine_a = {
					{
						"buffers",
						-- Shows shortened relative path when set to false.
						show_filename_only = true,
						-- Hide filename extension when set to true.
						hide_filename_extension = false,
						-- Shows indicator when the buffer is modified.
						show_modified_status = true,

						mode = 0, -- 0: Shows buffer name
						-- 1: Shows buffer index
						-- 2: Shows buffer name + buffer index
						-- 3: Shows buffer number
						-- 4: Shows buffer name + buffer number
						max_length = vim.o.columns * 2 / 3,
						filetype_names = {
							TelescopePrompt = "Telescope",
							dashboard = "Dashboard",
							packer = "Packer",
							fzf = "FZF",
							alpha = "Alpha",
						}, -- Shows specific buffer name for that filetype ( { `filetype` = `buffer_name`, ... } )
						use_mode_colors = false,

						symbols = {
							-- Text to show when the buffer is modified
							modified = " ●",
							-- Text to show to identify the alternate file
							alternate_file = "#",
							-- Text to show when the buffer is a directory
							directory = "",
						},
					},
				},
			},
		})
	end,
}
