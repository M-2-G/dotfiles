return {
    {
    "lewis6991/gitsigns.nvim",
    config = function ()
        require("gitsigns").setup()
        vim.keymap.set("n", "<leader>gp",  ":Gitsigns preview_hunk<CR>", {desc = "[g]it [p]review hunk"})
        vim.keymap.set("n", "<leader>gbl", ":Gitsigns toggle_current_line_blame<CR>", {desc = "[g]it [b]lame [l]ine"})
        vim.keymap.set("n", "<leader>gbf", ":Gitsigns blame<CR>", {desc = "[g]it [b]lame [f]ile"})
    end
    },
    {
        "sindrets/diffview.nvim",
        config = function()
            require("diffview").setup()
            vim.keymap.set("n", "<leader>gdo", ":DiffviewOpen <CR>", {desc = "[g]it [d]iff [o]pen"})
            vim.keymap.set("n", "<leader>gdd", ":DiffviewOpen develop<CR>", {desc = "[f]it [d]iff [d]evelop open"}) -- default open diffView on develop branch
            vim.keymap.set("n", "<leader>gdc", ":DiffviewClose <CR>", {desc = "[f]it [d]iff [c]lose"})
            vim.keymap.set("n", "<leader>gdh", ":DiffviewFileHistory %<CR>", {desc = "[f]it [d]iff [h]istory"})-- default open diffView on current file
        end
    }
}
