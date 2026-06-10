return {
    "nvim-treesitter/nvim-treesitter-context", -- dummy dep to ensure it loads after
    event = "VeryLazy",
    config = function()
        local function set_highlights()
            -- treesitter-context
            vim.api.nvim_set_hl(0, "TreesitterContext", { link = "CursorLine" })
            vim.api.nvim_set_hl(0, "TreesitterContextLineNumber", { link = "LineNr" })
            vim.api.nvim_set_hl(0, "TreesitterContextSeparator", { link = "Comment" })
        end

        set_highlights()
        vim.api.nvim_create_autocmd("ColorScheme", { callback = set_highlights })
    end,
}
