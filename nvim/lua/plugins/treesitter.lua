return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate", 
    config = function()
        local treesitter_cfg = require("nvim-treesitter.configs")
        treesitter_cfg.setup({
            ensure_installed = {
                "lua",
                "vim",
                "bash",
                "c",
                "cpp",
                "css",
                "dart",
                "css",
                "csv",
                "dockerfile",
                "go",
                "graphql",
                "html",
                "java",
                "rust",
                "sql",
                "xml",
                "yaml"
            },
            highlight = { enable = true },
            indent = { enable = true },
        })

    end
}

