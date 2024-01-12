return {
	"mhartington/formatter.nvim",
	config = function()
		local util = require("formatter.util")
		local pyform = {}
		function pyform.ruff()
			return {
				exe = "ruff",
				args = {
					"format",
                    "--config",
                    "$HOME/.config/ruff.toml",
					"-q",
					"-",
				},
				stdin = true,
			}
		end

		require("formatter").setup({
			logging = true,
			log_level = vim.log.levels.WARN,
			filetype = {
				lua = {
					require("formatter.filetypes.lua").stylua,
					function()
						return {
							exe = "stylua",
							args = {
								"--search-parent-directories",
								"--stdin-filepath",
								util.escape_path(util.get_current_buffer_file_path()),
								"--",
								"-",
							},
							stdin = true,
						}
					end,
				},
				xml = {
					require("formatter.filetypes.xml").xmllint,
				},
				json = {
					require("formatter.filetypes.json").fixjson,
					function()
						return {
							exe = "fixjson",
							args = {
								util.escape_path(util.get_current_buffer_file_path()),
							},
							stdin = true,
						}
					end,
				},
				python = {
					pyform.ruff(),
				},
			},

			["*"] = {
				require("formatter.filetypes.any").remove_trailing_whitespace,
			},
			vim.keymap.set({ "n", "x" }, "gq", vim.cmd.Format),
		})
	end,
}