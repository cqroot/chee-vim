local M = {}

function M.load()
    local null_ls = require("null-ls")
    vim.lsp.buf.format({ timeout_ms = 5000 })

    null_ls.setup({
        -- -- Format on save
        -- on_attach = function(client, bufnr)
        --     local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
        --     if client.supports_method("textDocument/formatting") then
        --         vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
        --         vim.api.nvim_create_autocmd("BufWritePre", {
        --             group = augroup,
        --             buffer = bufnr,
        --             callback = function()
        --                 vim.lsp.buf.format({ bufnr = bufnr })
        --             end,
        --         })
        --     end
        -- end,
        sources = {
            null_ls.builtins.formatting.black,
            null_ls.builtins.formatting.clang_format,
            null_ls.builtins.formatting.cmake_format,
            null_ls.builtins.formatting.eslint_d.with({
                filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" },
            }),
            null_ls.builtins.formatting.gofumpt.with({
                filetypes = { "go" },
            }),
            null_ls.builtins.formatting.prettierd.with({
                filetypes = {
                    "markdown",
                    "css",
                    "scss",
                    "less",
                    "html",
                    "json",
                    "jsonc",
                    "yaml",
                    "markdown",
                    "markdown.mdx",
                    "graphql",
                    "handlebars",
                },
            }),
            null_ls.builtins.formatting.shfmt,
            null_ls.builtins.formatting.stylua,
            null_ls.builtins.formatting.taplo.with({
                filetypes = { "toml" },
            }),

            null_ls.builtins.diagnostics.golangci_lint.with({
                filetypes = { "go" },
            }),
            -- null_ls.builtins.diagnostics.shellcheck,
        },
    })
end

return M
