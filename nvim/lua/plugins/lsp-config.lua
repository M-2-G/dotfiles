return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "dockerls",
                    "docker_compose_language_service",
                    "gradle_ls",
                    "gopls",
                    "graphql",
                    "html",
                    "jsonls",
                    "jdtls",
                    "rust_analyzer"
                }
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspConfig = require("lspconfig")
            lspConfig.lua_ls.setup({})

            vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, {})
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
            vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
            vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, {})
            vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, {})
            vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, {})
            vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, {})
            vim.keymap.set('n', 'gr', vim.lsp.buf.references, {})
            vim.keymap.set('n', '<space>f=', function()
                vim.lsp.buf.format { async = true }
            end, {})
        end
    }
}

