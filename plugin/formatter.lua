local util = require("formatter.util")

local pyform = {}

function pyform.black()
	return {
		exe = "black",
		args = { "-l 120", "-q", "--stdin-filename", util.escape_path(util.get_current_buffer_file_name()), "-" },
		stdin = true,
	}
end
function pyform.isort()
	return {
		exe = "isort",
		args = { "-l 120", "-q", "--filename", util.escape_path(util.get_current_buffer_file_path()), "-" },
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
			pyform.black(),
			pyform.isort(),
		},
	},

	["*"] = {
		require("formatter.filetypes.any").remove_trailing_whitespace,
	},
})
