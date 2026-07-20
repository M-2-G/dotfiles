local ensure = { "c_sharp", "sql", "lua", "json", "yaml", "bash", "markdown", "python", "rust" }

return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        local nt = require("nvim-treesitter")
        nt.install(ensure)

        -- Enable treesitter highlight/indent/folds for a buffer.
        local function enable(buf)
            if not pcall(vim.treesitter.start, buf) then
                return
            end
            vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
            vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end

        vim.api.nvim_create_autocmd("FileType", {
            callback = function(ev)
                -- Map filetype -> parser name (e.g. "cs" -> "c_sharp").
                local lang = vim.treesitter.language.get_lang(ev.match) or ev.match

                -- Already installed: start immediately.
                if vim.tbl_contains(nt.get_installed(), lang) then
                    enable(ev.buf)
                    return
                end

                -- Not installed but a parser exists upstream: install on demand,
                -- then start highlighting for this buffer once it finishes.
                if vim.tbl_contains(nt.get_available(), lang) then
                    nt.install(lang):await(function(err)
                        if not err and vim.api.nvim_buf_is_valid(ev.buf) then
                            vim.schedule(function()
                                enable(ev.buf)
                            end)
                        end
                    end)
                end
                -- No parser upstream: fall back to Neovim's regex syntax (nothing to do).
            end,
        })
    end,
}
