return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		vim.keymap.set("n", "<leader>to", ":Neotree filesystem reveal left<CR>", {desc = "[t]ree [o]pen"})
		vim.keymap.set("n", "<leader>tc", ":Neotree close<CR>", { desc = "[t]ree [c]lose"})
	end,
}
