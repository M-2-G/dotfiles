return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettier,
                null_ls.builtins.diagnostics.pylint,
                null_ls.builtins.formatting.csharpier,
			},
		})
		vim.keymap.set("n", "<leader>bf", vim.lsp.buf.format, { desc = "[b]uffer [f]ormat" })
	end,
}
