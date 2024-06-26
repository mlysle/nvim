return {
	"https://github.com/rcarriga/nvim-dap-ui",
	dependencies = {
		"https://github.com/mfussenegger/nvim-dap",
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		require("dapui").setup()

		dap.adapters.gdb = {
			type = "executable",
			command = "gdb",
			args = { "-i", "dap" },
		}

		dap.adapters.cppdbg = {
			id = 'cppdbg',
			type = 'executable',
			command = '/home/mally/.local/share/nvim/mason/bin/OpenDebugAD7',
		}

		dap.configurations.cpp = {
			{
				name = "Launch file",
				type = "cppdbg",
				request = "launch",
				program = function()
					return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
				end,
				cwd = '${workspaceFolder}',
				stopAtEntry = true,
			},
			{
				name = 'Attach to gdbserver :1234',
				type = 'cppdbg',
				request = 'launch',
				MIMode = 'gdb',
				miDebuggerServerAddress = 'localhost:1234',
				miDebuggerPath = '/usr/bin/gdb',
				cwd = '${workspaceFolder}',
				program = function()
					return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
				end,
			},
		}
		-- vim.keymap.set('n', '<Leader>dt', function() dap.toggle_breakpoint() end)
		-- vim.keymap.set('n', '<Leader>dc', function() dap.continue() end)
		vim.keymap.set('n', '<Leader>dt', dap.toggle_breakpoint, {})
		vim.keymap.set('n', '<Leader>dc', dap.continue, {})

		vim.keymap.set('n', '<F10>', function() dap.step_over() end)
		vim.keymap.set('n', '<F11>', function() dap.step_into() end)
		vim.keymap.set('n', '<F12>', function() dap.step_out() end)

		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end
	end,
}
