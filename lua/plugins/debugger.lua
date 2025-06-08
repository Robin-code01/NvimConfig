return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
		"theHamsta/nvim-dap-virtual-text",
	},
	config = function()
		local dap, dapui = require("dap"), require("dapui")

		require("dapui").setup()

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
		vim.keymap.set("n", "<leader>dt", dap.toggle_breakpoint, {})
		vim.keymap.set("n", "<leader>dc", dap.continue, {})
		--		vim.keymap.set("n", "<leader>dr", dap.repl.open, {})
		--		vim.keymap.set("n", "<leader>do", dap.step_over, {})
		--		vim.keymap.set("n", "<leader>di", dap.step_into, {})
		--		vim.keymap.set("n", "<leader>du", dap.step_out, {})
		vim.keymap.set("n", "<leader>dq", function()
			require("dap").terminate()
			require("dapui").close()
		end, { desc = "Exit debugger" })

		vim.keymap.set("n", "<leader>dd", function()
			local fname = vim.fn.expand("%:r") -- e.g., 'main' from 'main.c'
			local flags = vim.fn.input("Extra gcc flags (e.g., -lcs50 -lm): ")

			-- compile with optional flags
			vim.fn.jobstart("gcc -g " .. fname .. ".c -o " .. fname .. " " .. flags, {
				stdout_buffered = true,
				stderr_buffered = true,
				on_stdout = function(_, data)
					if data then
						print(table.concat(data, "\n"))
					end
				end,
				on_stderr = function(_, data)
					if data then
						print(table.concat(data, "\n"))
					end
				end,
--				on_exit = function()
--					require("dap").run({
--						name = "Quick Debug with Flags",
--						type = "cppdbg",
--						request = "launch",
--						program = vim.fn.getcwd() .. "/" .. fname,
--						cwd = vim.fn.getcwd(),
--						stopAtEntry = true,
--						MIMode = "gdb",
--						miDebuggerPath = "/usr/bin/gdb",
--					})
--				end,
			})
		end, { desc = "Build and Debug current C file with optional libs" })

		-- setup debug server:

		dap.adapters.cppdbg = {
			id = "cppdbg",
			type = "executable",
			command = "/home/robin/.config/nvim/debuggers/cpptools/lua/extension/debugAdapters/bin/OpenDebugAD7",
		}
		dap.configurations.cpp = {
			{
				name = "Launch file",
				type = "cppdbg",
				request = "launch",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				cwd = "${workspaceFolder}",
				stopAtEntry = true,
			},
			{
				name = "Attach to gdbserver :1234",
				type = "cppdbg",
				request = "launch",
				MIMode = "gdb",
				miDebuggerServerAddress = "localhost:1234",
				miDebuggerPath = "/usr/bin/gdb",
				cwd = "${workspaceFolder}",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
			},
		}
		dap.configurations.c = dap.configurations.cpp
		dap.configurations.rust = dap.configurations.cpp
	end,
}
