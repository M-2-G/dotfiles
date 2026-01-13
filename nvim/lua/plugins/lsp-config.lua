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
                    "basedpyright",
                    "ruff",
                    "rust_analyzer",
                },
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            local function enable_server(server_name, config)
                config = config or {}
                -- Merge capabilities with any existing capabilities in the config
                config.capabilities = vim.tbl_deep_extend("force", capabilities, config.capabilities or {})
                -- Assign config to the native Neovim table
                vim.lsp.config[server_name] = config
                -- Enable the server (starts it for the current buffer & sets up filetype hooks)
                vim.lsp.enable(server_name)
            end

            enable_server("ts_ls")
            enable_server("html")
            enable_server("lua_ls")
            enable_server("ruff")
            enable_server("dockerls")
            enable_server("jsonls")

            enable_server("basedpyright", {
                settings = {
                   basedpyright = {
                        analysis = {
                            autoSearchPaths = true,
                            diagnosticMode = "openFilesOnly",
                            useLibraryCodeForTypes = true,
                            typeCheckingMode = "recommended", -- Options: ["off", "basic", "standard", "strict", "recommended", "all"]
                            inlayHints = {
                                callArgumentNames = true,
                            }
                        },
                    },
                },
            })

            enable_server("rust_analyzer", {
                settings = {
                    ["rust-analyzer"] = {
                        files = { watcher = "server" },
                        cargo = { targetDir = true },
                        check = { command = "clippy" },
                        inlayHints = {
                            bindingModeHints = { enabled = true },
                            closureCaptureHints = { enabled = true },
                            closureReturnTypeHints = { enable = "always" },
                            maxLength = 100,
                        },
                        rustc = { source = "discover" },
                    },
                },
            })

            vim.keymap.set("n", "<leader>cd", vim.lsp.buf.declaration, { desc = "[c]ode [d]eclaration" })
            vim.keymap.set("n", "<leader>cf", vim.lsp.buf.definition, { desc = "[c]ode de[f]inition" })
            vim.keymap.set("n", "<leader>cc", vim.lsp.buf.hover, { desc = "[c]ode do[c]umentation" })
            vim.keymap.set("n", "<leader>ci", vim.lsp.buf.implementation, { desc = "[c]ode [i]implementation" })
            vim.keymap.set("n", "<leader>cs", vim.lsp.buf.signature_help, { desc = "[c]ode [s]ignature" })
            vim.keymap.set("n", "<leader>ct", vim.lsp.buf.type_definition, { desc = "[c]ode [t]ype definition" })
            vim.keymap.set("n", "<leader>cn", vim.lsp.buf.rename, { desc = "[c]ode re[n]ame" })
            vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "[c]ode [a]ctions" })
            vim.keymap.set("n", "<leader>cr", vim.lsp.buf.references, { desc = "[c]ode [r]eferences" })
            vim.keymap.set("n", "<leader>f=", function()
                vim.lsp.buf.format({ async = true })
            end, {})
            vim.keymap.set("n", "<leader>ch", function()
                vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
            end, { desc = "[c]ode [h]ints toggle" })
        end,
    },
}
