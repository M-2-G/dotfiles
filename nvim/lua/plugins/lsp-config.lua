return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "dockerls",
                    "docker_compose_language_service",
                    "html",
                    "ts_ls",
                    "jsonls",
                    "pyright",
                    "ruff",
                },
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            local lspconfig = require("lspconfig")
            lspconfig.ts_ls.setup({
                capabilities = capabilities,
            })
            lspconfig.html.setup({
                capabilities = capabilities,
            })
            lspconfig.lua_ls.setup({
                capabilities = capabilities,
            })
	    lspconfig.ruff.setup({
                capabilities = capabilities,
            })
            lspconfig.pyright.setup({
                capabilities = capabilities,
            })

            vim.keymap.set("n", "<leader>cd", vim.lsp.buf.declaration, { desc = "[C]ode [D]eclaration" })
            vim.keymap.set("n", "<leader>cf", vim.lsp.buf.definition, { desc = "[C]ode de[F]inition" })
            vim.keymap.set("n", "<leader>cc", vim.lsp.buf.hover, { desc = "[C]ode do[C]umentation" })
            vim.keymap.set("n", "<leader>ci", vim.lsp.buf.implementation, { desc = "[C]ode [I]implementation" })
            vim.keymap.set("n", "<leader>cs", vim.lsp.buf.signature_help, { desc = "[C]ode [S]ignature" })
            vim.keymap.set("n", "<leader>ct", vim.lsp.buf.type_definition, { desc = "[C]ode [T]ype definition" })
            vim.keymap.set("n", "<leader>cn", vim.lsp.buf.rename, { desc = "[C]ode re[N]ame" })
            vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "[C]ode [A]ctions" })
            vim.keymap.set("n", "<leader>cr", vim.lsp.buf.references, { desc = "[C]ode [R]eferences" })
            vim.keymap.set("n", "<leader>f=", function()
                vim.lsp.buf.format({ async = true })
            end, {})
        end,
    },
}
