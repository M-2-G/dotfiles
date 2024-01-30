return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local treesitter_cfg = require("nvim-treesitter.configs")
        treesitter_cfg.setup({
            auto_install = true,
            highlight = { enable = true },
            indent = { enable = true },
        })

    end
}

