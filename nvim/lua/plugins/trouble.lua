return {
    "folke/trouble.nvim",
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
    keys = {
        {
            "<leader>Td",
            "<cmd>Trouble diagnostics toggle<cr>",
            desc = "[T]rouble [d]iagnostics toggle",
        },
        {
            "<leader>Tb",
            "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
            desc = "[T]rouble [b]uffer Diagnostics",
        },
        {
            "<leader>Ts",
            "<cmd>Trouble symbols toggle focus=false<cr>",
            desc = "[T]rouble [s]ymbols",
        },
        {
            "<leader>To",
            "<cmd>Trouble lsp toggle focus=false win.position=bottom<cr>",
            desc = "[T]rouble [o]pen (toggle) LSP Definitions / references / ...",
        },
        {
            "<leader>Tl",
            "<cmd>Trouble loclist toggle<cr>",
            desc = "[T]rouble [l]ocation List (Trouble)",
        },
        {
            "<leader>Tq",
            "<cmd>Trouble qflist toggle<cr>",
            desc = "[T]rouble [q]uickfix List",
        },
    },
}
