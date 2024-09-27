return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
		"theHamsta/nvim-dap-virtual-text",
	},
	config = function()
		local dap, dapui = require("dap"), require("dapui")
		dapui.setup()
       -- require("dap").set_log_level("TRACE")

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

		vim.keymap.set("n", "<Leader>dc", function()
			dap.continue()
		end, { desc = "[D]ebug [C]ontinue" })
		vim.keymap.set("n", "<Leader>do", function()
			dap.step_over()
		end, { desc = "[D]ebug [O]ver" })
		vim.keymap.set("n", "<Leader>di", function()
			dap.step_into()
		end, { desc = "[D]ebug [I]nto" })
		vim.keymap.set("n", "<Leader>dt", function()
			dap.step_out()
		end, { desc = "[D]ebug ou[T]" })
		vim.keymap.set("n", "<Leader>db", function()
			dap.toggle_breakpoint()
		end, { desc = "[D]ebug [B]reakpoint" })
		dap.configurations.java = {
			{
				name = "Debug Launch (2GB)",
				type = "java",
				request = "launch",
				vmArgs = "" .. "-Xmx2g ",
			},
			{
				name = "Debug Attach (8000)",
				type = "java",
				request = "attach",
				hostName = "127.0.0.1",
				port = 8000,
			},
			{
				name = "Debug Attach (5005)",
				type = "java",
				request = "attach",
				hostName = "127.0.0.1",
				port = 5005,
			},
			{
				name = "My Custom Java Run Configuration",
				type = "java",
				request = "launch",
				-- You need to extend the classPath to list your dependencies.
				-- `nvim-jdtls` would automatically add the `classPaths` property if it is missing
				-- classPaths = {},

				-- If using multi-module projects, remove otherwise.
				-- projectName = "yourProjectName",

				-- javaExec = "java",
				mainClass = "day1.Day1",

				-- If using the JDK9+ module system, this needs to be extended
				-- `nvim-jdtls` would automatically populate this property
				-- modulePaths = {},
				vmArgs = "-Xmx2g -agentlib:jdwp=transport=dt_socket,server=y,suspend=y,address=*:5005",
			},
			{
				type = "java",
				request = "launch",
				name = "Debug (Launch) - Current File",
				program = function()
					return vim.fn.input("Path to file: ", vim.fn.getcwd() .. "/", "file")
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
			},
		}
	end,
}
