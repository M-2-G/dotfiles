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
                { "<leader>b", group = "[b]uffer" },
                { "<leader>c", group = "[c]ode" },
                { "<leader>d", group = "[d]ebug" },
                { "<leader>f", group = "[f]ind" },
                { "<leader>g", group = "[g]it" },
                { "<leader>t", group = "[t]ree" },
                { "<leader>T", group = "[T]rouble" },
            },
        })
    end,
}
