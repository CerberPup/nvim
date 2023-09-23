--debugging

local ok, dap = pcall(require, "dap")
if not ok then return end

local dapui = require("dapui")

vim.keymap.set("n", "<F5>", ":lua require'dap'.continue()<CR>")
vim.keymap.set("n", "<F10>", ":lua require'dap'.step_over()<CR>")
vim.keymap.set("n", "<F11>", ":lua require'dap'.step_into()<CR>")
vim.keymap.set("n", "<S-F11>", ":lua require'dap'.step_out()<CR>")
vim.keymap.set("n", "<leader>b", ":lua require'dap'.toggle_breakpoint()<CR>")
vim.keymap.set("n", "<leader>B", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
vim.keymap.set("n", "<leader>lp", ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>")
vim.keymap.set("n", "<leader>dr", ":lua require'dap'.repl.open()<CR>")
vim.keymap.set("n", "<leader>dl", ":lua require'dap'.terminate()<CR>")
vim.keymap.set("n", "<leader>dt", ":lua require'dap-go'.debug_test()<CR>")

require("nvim-dap-virtual-text").setup()
require('dap-go').setup()
dapui.setup()

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

require ('mason-nvim-dap').setup({
    automatic_setup = true,
    ensure_installed = {'python'},
    handlers={
    function(source_name)
      -- all sources with no handler get passed here
          -- dap.configurations.cpp = {
          --   {
          --     name = "Launch file",
          --     type = "cppdbg",
          --     request = "launch",
          --     MIMode = 'lldb',
          --     program = function()
          --       return vim.fn.input({'Path to executable: '}, vim.fn.getcwd() .. '/', 'file')
          --     end,
          --     cwd = '${workspaceFolder}',
          --     stopAtEntry = false,
          --     externalConsole = false,
          --     args = function()
          --       return {vim.fn.input({'Argument: '})}
          --     end,
          --   },
          --   {
          --     name = "out run arg",
          --     type = "cppdbg",
          --     request = "launch",
          --     MIMode = 'lldb',
          --     program = function()
          --       return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/build/out')
          --     end,
          --     cwd = '${workspaceFolder}',
          --     stopAtEntry = false,
          --     externalConsole = false,
          --     args = function()
          --       return {vim.fn.input('Argument: ')}
          --     end,
          --   },
          --   {
          --     name = "out run ",
          --     type = "cppdbg",
          --     request = "launch",
          --     MIMode = 'lldb',
          --     program = function ()
          --       return vim.fn.getcwd() .. '/out'
          --     end,
          --     cwd = '${workspaceFolder}',
          --     stopAtEntry = false,
          --     externalConsole = false,
          --     args = {'input.txt'},
          --   },
          --   --{
          --   --  name = 'Attach to gdbserver :1234',
          --   --  type = 'cppdbg',
          --   --  request = 'launch',
          --   --  MIMode = 'gdb',
          --   --  miDebuggerServerAddress = 'localhost:1234',
          --   --  miDebuggerPath = '/usr/bin/gdb',
          --   --  cwd = '${workspaceFolder}',
          --   --  program = function()
          --   --    return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
          --   --  end,
          --   --},
          -- }
          -- dap.configurations.c = dap.configurations.cpp
        dap.configurations.rust ={
          {
            name = "Rust lanunch",
            type = "cppdbg",
            request = "launch",
            MIMode = 'lldb',
            program = function()
              local execname = string.match(vim.fn.getcwd(),".*/(.*)")
              return vim.fn.getcwd() .. "/target/debug/" .. execname
            end,
            cwd = '${workspaceFolder}',
            stopAtEntry = false,
            externalConsole = false,
            args = function()
              return {vim.fn.input('Argument: ')}
            end,
          }}

        -- INFO: execute ~/Downloads/vscode-extensions/codelldb/extension/adapter/codelldb --port 13000

        -- dap.adapters.codelldb = {
        --   type = 'server',
        --   port = 13000,
        --   executable = {
        --     -- CHANGE THIS to your path!
        --     command = function ()
        --       return vim.fn.stdpath("data") .. "/mason/bin/codelldb"
        --     end,
        --     args = {"--port", "13000"},
        --
        --     -- On windows you may have to uncomment this:
        --     -- detached = false,
        --   }
        -- }

        dap.configurations.cpp = {
          {
            name = "Launch out",
            type = 'codelldb',
            request = 'launch',
            program = function()
              return  vim.fn.getcwd() .. '/out'
            end,
            --program = '${fileDirname}/${fileBasenameNoExtension}',
            cwd = '${workspaceFolder}',
            terminal = 'integrated'
          },
          {
            name = "Launch arg",
            type = 'codelldb',
            request = 'launch',
            program = function()
              return vim.fn.input('Path to executable: ', vim.fn.getcwd()..'/', 'file')
            end,
            --program = '${fileDirname}/${fileBasenameNoExtension}',
            cwd = '${workspaceFolder}',
            terminal = 'integrated'
          }
        }

        dap.configurations.c = dap.configurations.c
--
--        dap.configurations.rust = {
--            {
--                type = 'codelldb',
--                request = 'launch',
--                program = function()
--                    return vim.fn.input('Path to executable: ', vim.fn.getcwd()..'/', 'file')
--                end,
--                cwd = '${workspaceFolder}',
--                terminal = 'integrated',
--                sourceLanguages = { 'rust' }
--            }
--        }

      -- Keep original functionality of `automatic_setup = true`
      require('mason-nvim-dap.automatic_setup')(source_name)
    end,
    python = function(source_name)
        dap.adapters.python = {
	        type = "executable",
	        command = "/usr/bin/python3",
	        args = {
		        "-m",
		        "debugpy.adapter",
	        },
        }

        dap.configurations.python = {
	        {
		        type = "python",
		        request = "launch",
		        name = "Launch file",
		        program = "${file}", -- This configuration will launch the current file if used.
	        },
        }
    end,
  }
})

