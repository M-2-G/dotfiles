return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.5",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local telescopeBuiltin = require("telescope.builtin")
            vim.keymap.set("n", "<leader>ff", telescopeBuiltin.find_files, { desc = "[f]ind [f]iles" })
            vim.keymap.set("n", "<leader>fg", telescopeBuiltin.live_grep, { desc = "[f]ind by [g]rep" })
            vim.keymap.set("n", "<leader>fd", telescopeBuiltin.diagnostics, { desc = "[f]ind [d]iagnostics using LSP" })
            vim.keymap.set("n", "<leader>fr", telescopeBuiltin.resume, { desc = "[f]ind [r]esume search" })
            vim.keymap.set("n", "<leader>fb", telescopeBuiltin.buffers, { desc = "[f]ind in open [b]uffers" })
        end,
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
            require("telescope").setup({
                defaults = {
                    prompt_prefix = " ",
                    selection_caret = " ",
                    path_display = { "smart" },
                    dynamic_preview_title = true,
                    winblend = 10,
                    sorting_strategy = "ascending",
               },
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown({}),
                    },
                },
            })
            require("telescope").load_extension("ui-select")
        end,
    },
}
