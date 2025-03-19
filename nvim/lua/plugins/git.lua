return {
    {
    "lewis6991/gitsigns.nvim",
    config = function ()
        require("gitsigns").setup()
        vim.keymap.set("n", "<leader>gp",  ":Gitsigns preview_hunk<CR>", {desc = "[G]it [P]review hunk"})
        vim.keymap.set("n", "<leader>gbl", ":Gitsigns toggle_current_line_blame<CR>", {desc = "[G]it [B]lame [L]ine"})
        vim.keymap.set("n", "<leader>gbf", ":Gitsigns blame<CR>", {desc = "[G]it [B]lame [F]ile"})
    end
    },
    {
        "sindrets/diffview.nvim",
        config = function()
            require("diffview").setup()
            vim.keymap.set("n", "<leader>gdo", ":DiffviewOpen <CR>", {desc = "[G]it [D]iff [O]pen"})
            vim.keymap.set("n", "<leader>gdd", ":DiffviewOpen develop<CR>", {desc = "[G]it [D]iff [D]evelop open"}) -- default open diffView on develop branch
            vim.keymap.set("n", "<leader>gdc", ":DiffviewClose <CR>", {desc = "[G]it [D]iff [C]lose"})
            vim.keymap.set("n", "<leader>gdh", ":DiffviewFileHistory %<CR>", {desc = "[G]it [D]iff [H]istory"})-- default open diffView on current file
        end
    }
}
