return {
	"axkirillov/easypick.nvim",
	lazy = true,
	keys = {
		{ "<leader>fc", "<cmd>Easypick changed_files<cr>", desc = "easypick" },
	},
	config = function()
		local easypick = require("easypick")
		local get_default_branch = "git remote show origin | grep 'HEAD branch' | cut -d' ' -f5"
		local base_branch = vim.fn.system(get_default_branch) or "main"

		easypick.setup({
			-- local easypick = require("easypick"),
			pickers = {
				-- add your custom pickers here
				-- below you can find some examples of what those can look like

				-- list files inside current folder with default previewer
				-- diff current branch with base_branch and show files that changed with respective diffs in preview
				{
					name = "changed_files",
					command = "git diff --name-only $(git merge-base HEAD " .. base_branch .. " )",
					previewer = easypick.previewers.branch_diff({ base_branch = base_branch }),
				},

				-- list files that have conflicts with diffs in preview
				{
					name = "conflicts",
					command = "git diff --name-only --diff-filter=U --relative",
					previewer = easypick.previewers.file_diff(),
				},
			},
		})
	end,
}
