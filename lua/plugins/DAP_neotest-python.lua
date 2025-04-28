return {
	"nvim-neotest/neotest-python",
	dependencies = {
		"nvim-neotest/neotest",
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		require("neotest").setup({
            default_strategy = "dap",
            -- floating
			adapters = {
				require("neotest-python")({
					-- Extra arguments for nvim-dap configuration
					-- See https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for values
					dap = { justMyCode = false, console = "integratedTerminal"},
					-- Command line arguments for runner
					-- Can also be a function to return dynamic values
					args = {
						"/home/mironov_a/Corp-FWaaS/test/ngfw/conftest.py",
						"--rootdir=/home/mironov_a/Corp-FWaaS/test",
						"--configroot=test/configs",
						"--libs-path=/home/mironov_a/Corp-FWaaS/test/ngfw/ngfw_ktt/libs",
						"--log-cli-level=DEBUG",
						"--log-file-level=DEBUG",
						"--log-file=/tmp/pytest-logs.txt",
						"--configfile=test/configs/root/password_manager_debug.yaml,test/ngfw/tests/ssl_inspection/test_ssl_inspection.yaml",
					},

					-- Runner to use. Will use pytest if available by default.
					-- Can be a function to return dynamic value.
					runner = "pytest",
					-- Custom python path for the runner.
					-- Can be a string or a list of strings.
					-- Can also be a function to return dynamic value.
					-- If not provided, the path will be inferred by checking for
					-- virtual envs in the local directory and for Pipenev/Poetry configs
					python = "/home/mironov_a/.virtualenvs/ngfw-ktt-guLNkaGs-py3.12/bin/python3",
					-- Returns if a given file path is a test file.
					-- NB: This function is called a lot so don't perform any heavy tasks within it.
					-- is_test_file = function(file_path)
					-- 	-- ...
					-- end,
					-- !!EXPERIMENTAL!! Enable shelling out to `pytest` to discover test
					-- instances for files containing a parametrize mark (default: false)
					pytest_discover_instances = false,
				}),
			},
		})
	end,
}
