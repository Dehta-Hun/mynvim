return {
	"mfussenegger/nvim-dap-python",
	ft = "python",
	dependencies = { "mfussenegger/nvim-dap" },
	config = function()
		local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
		require("dap-python").setup(path)
		local pythonAttachConfig = {
			type = "python",
			request = "attach",
			connect = {
				port = 5678,
				host = "127.0.0.1",
			},
			mode = "remote",
			name = "Aganemnomnom",
			cwd = vim.fn.getcwd(),
			pathMappings = {
				{
					localRoot = vim.fn.getcwd(),
					remoteRoot = "/home/mironov_a/Corp-FWaaS/",
				},
			},
		}
		table.insert(require("dap").configurations.python, pythonAttachConfig)
	end,
}
