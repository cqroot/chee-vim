local M = {}

function M.load()
	local null_ls = require("null-ls")
	local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
	vim.lsp.buf.format({ timeout_ms = 5000 })

	null_ls.setup({
		on_attach = function(client, bufnr)
			if require("core.utils").get("format_on_save") and client.supports_method("textDocument/formatting") then
				vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
				vim.api.nvim_create_autocmd("BufWritePre", {
					group = augroup,
					buffer = bufnr,
					callback = function()
						vim.lsp.buf.format({ bufnr = bufnr })
					end,
				})
			end
		end,
		sources = {
			null_ls.builtins.formatting.black,
			null_ls.builtins.formatting.clang_format,
			null_ls.builtins.formatting.cmake_format,
			null_ls.builtins.formatting.prettierd,
			null_ls.builtins.formatting.shfmt,
			null_ls.builtins.formatting.stylua,
			null_ls.builtins.formatting.taplo,

			null_ls.builtins.diagnostics.golangci_lint,
			null_ls.builtins.diagnostics.shellcheck,
		},
	})
end

return M
