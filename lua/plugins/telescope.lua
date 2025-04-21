return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local builtin = require("telescope.builtin")
		local custom_pickers = require("plugins.addons.telescope_custom_pickers")
		local keymap = vim.keymap.set
		local opts = { noremap = true, silent = true }
		require("telescope").setup({
			extensions = {
				fzf = {
					fuzzy = true, -- false will only do exact matching
					override_generic_sorter = true, -- override the generic sorter
					override_file_sorter = true, -- override the file sorter
					case_mode = "smart_case", -- or "ignore_case" or "respect_case"
					-- the default case_mode is "smart_case"
				},
			},
			require("telescope").load_extension("fzf"),
			defaults = {
				layout_config = {
					horizontal = { width = 0.99 },
				},
				vimgrep_arguments = {
					"rg",
					"--color=never",
					"-uu",
					"--no-heading",
					"--with-filename",
					"--line-number",
					"--column",
					"--smart-case",
					"--glob=!**/.git/*",
				},
			},
			pickers = {
				find_files = {
					hidden = true,
					find_command = {
						"rg",
						"--files",
						"--color=never",
						"-uu",
						"--no-heading",
						"--with-filename",
						"--line-number",
						"--column",
						"--smart-case",
						"--glob=!**/.git/*",
					},
				},
				live_grep = {
					-- path_display = { "shorten" },
					mappings = {
						i = {
							["<c-f>"] = custom_pickers.actions.set_extension,
							["<c-l>"] = custom_pickers.actions.set_folders,
						},
					},
				},
			},
		})

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

		keymap("n", "<leader>fs", function()
			local nvim_tree_api = require("nvim-tree.api")
			local nvim_tree_util = require("nvim-tree.utils")
			local core = require("nvim-tree.core")
			local node = require("nvim-tree.node")
			local cwd = core.get_cwd()
		end)
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

		keymap("n", "<leader>fd", function()
			builtin.diagnostics({ bufnr = 0 })
		end, {})
	end,
}
