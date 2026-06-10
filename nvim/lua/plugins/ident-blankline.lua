return {
    "lukas-reineke/indent-blankline.nvim",
    event = "VeryLazy",
    main = "ibl",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = {
        indent = {
            char = "▏",
        },
        scope = {
            enabled = false,
            show_start = false,
            show_end = false,
            injected_languages = true,
        },
        exclude = {
            filetypes = { "help", "dashboard", "lazy", "mason" },
        },
    },
}
