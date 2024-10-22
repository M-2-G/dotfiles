return {
	"mfussenegger/nvim-dap-python",
	ft = "python",
	dependencies = {
		"mfussenegger/nvim-dap",
	},
	keys = {
		-- **Test-Related Key Mappings**
		{
			mode = "n",
			"<leader>dpm",
			function()
				require("dap-python").test_method()
			end,
			desc = "[D]ebug [P]ython Test Method",
		},
		{
			mode = "n",
			"<leader>dpc",
			function()
				require("dap-python").test_class()
			end,
			desc = "[D]ebug [P]ython Test [C]lass",
		},
	},
	config = function()
		local path = "~/dev/py_venv/bin/python"
		require("dap-python").setup(path)
		require("dap-python").test_runner = "pytest"
	end,
}
