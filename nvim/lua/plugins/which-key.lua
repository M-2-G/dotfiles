return {
	"folke/which-key.nvim",
	event = "VimEnter",
	config = function()
		-- gain access to the which key plugin
		local which_key = require("which-key")

		-- call the setup function with default properties
		which_key.setup()

		-- Register prefixes for the different key mappings we have setup previously
		which_key.add({
			{
				{ "<leader>J", group = "[J]ava" },
				{ "<leader>c", group = "[C]ode" },
				{ "<leader>d", group = "[D]ebug" },
				{ "<leader>f", group = "[F]ind" },
				{ "<leader>t", group = "[T]ree" },
                { "<leader>b", group = "[B]uffer" },
                { "<leader>g", group = "[G]it" },
			},
		})
	end,
}
