return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local builtin = require("telescope.builtin")
		local keymap = vim.keymap.set
		local opts = { noremap = true, silent = true }
		local pickers = { -- убрать локал если что то пойдет не так
			find_files = {
				hidden = true,
			},
		}
		function vim.getVisualSelection()
			vim.cmd('noau normal! "vy"')
			local text = vim.fn.getreg("v")
			vim.fn.setreg("v", {})

			text = string.gsub(text, "\n", "")
			if #text > 0 then
				return text
			else
				return ""
			end
		end

		keymap("n", "<leader>ff", builtin.find_files, {})
		keymap("v", "<leader>ff", function()
			local text = vim.getVisualSelection()
			builtin.find_files({ default_text = text })
		end, opts)

		keymap("n", "<leader>fg", builtin.git_files, {})
		keymap("v", "<leader>fg", function()
			local text = vim.getVisualSelection()
			builtin.git_files({ default_text = text })
		end, opts)

		keymap("n", "<leader>fs", builtin.live_grep, {})
		keymap("v", "<leader>fs", function()
			local text = vim.getVisualSelection()
			builtin.live_grep({ default_text = text })
		end, opts)

		keymap("n", "<leader>fb", builtin.buffers, {})

		keymap("n", "<leader>fh", builtin.help_tags, {})

		keymap("n", "<leader>fz", builtin.current_buffer_fuzzy_find, {})
		keymap("v", "<leader>fz", function()
			local text = vim.getVisualSelection()
			builtin.current_buffer_fuzzy_find({ default_text = text })
		end, opts)
	end,
}
