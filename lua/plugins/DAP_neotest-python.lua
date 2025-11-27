return {
  "nvim-neotest/neotest-python",
  dependencies = {
    "nvim-neotest/neotest",
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function ()
    local actions = require("telescope.actions")
    local action_state = require("telescope.actions.state")
    local builtin = require("telescope.builtin")
    local utils = require("telescope.utils")

    -- Async input using vim.ui.input
    local function get_input_async(prompt, callback)
      vim.ui.input({ prompt = prompt }, function (input)
        if not input or input == "" then
          callback(nil)
        else
          callback(input)
        end
      end)
    end

    local function pick_file(callback)
      builtin.find_files({
        find_command = { "fd", "--type", "f", "--extension", "yaml" },
        cwd = utils.buffer_dir(),
        attach_mappings = function (prompt_bufnr, map)
          actions.select_default:replace(function ()
            local entry = action_state.get_selected_entry()
            local path = entry.path or entry.value
            actions.close(prompt_bufnr)
            vim.schedule(function ()
              callback(path)
            end)
          end)
          return true
        end,
      })
    end

    -- Combined logic for <leader>dr
    vim.keymap.set("n", "<leader>dr", function ()
      get_input_async("Enter extra pytest args: ", function (additional_params)
        pick_file(function (path)
          local args = { "--configfile=" .. path }
          if additional_params and additional_params ~= "" then
            table.insert(args, additional_params)
          end

          require("neotest").run.run({
            extra_args = args,
            strategy = "dap",
          })
        end)
      end)
    end, { desc = "Run test with dynamic config file" })

    require("neotest").setup({
      default_strategy = "dap",
      adapters = {
        require("neotest-python")({
          summary = {
            open = "botright vsplit | vertical resize 80",
            -- To have the summary open on the left instead:
            -- open = "topleft vsplit | vertical resize 80",
          },
          -- Configure the output panel (for single tests)
          output_panel = {
            open = "botright split | resize 15",
          },
          -- Extra arguments for nvim-dap configuration
          -- See https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for values
          dap = { justMyCode = false, console = "internalConsole" },
          -- Command line arguments for runner
          args = {
            "/home/mironov_a/Corp-FWaaS/test/ngfw/conftest.py",
            "--rootdir=/home/mironov_a/Corp-FWaaS/test",
            "--log-cli-level=DEBUG",
            "--log-file=/tmp/pytest-logs.txt",
          },
          -- Can also be a function to return dynamic values
          -- Runner to use. Will use pytest if available by default.
          -- Can be a function to return dynamic value.
          runner = "pytest",
          python = "/home/mironov_a/.virtualenvs/ngfw-ktt-guLNkaGs-py3.12/bin/python3",
          pytest_discover_instances = false,
        }),
      },
    })
  end,
}
