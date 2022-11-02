local M = {}

function M.load()
	-- Set up lspconfig.
	local capabilities = require("cmp_nvim_lsp").default_capabilities()

	require("luasnip.loaders.from_vscode").lazy_load()

	local is_enabled = require("core.utils").is_enabled

	if is_enabled("go") then
		require("lspconfig").gopls.setup({
			capabilities = capabilities,
		})
	end

	if is_enabled("lua") then
		vim.g.neoformat_enabled_lua = { "stylua" }
		require("lspconfig").sumneko_lua.setup({
			capabilities = capabilities,
			settings = {
				Lua = {
					runtime = {
						-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
						version = "LuaJIT",
					},
					diagnostics = {
						-- Get the language server to recognize the `vim` global
						globals = { "vim" },
					},
					workspace = {
						-- Make the server aware of Neovim runtime files
						library = vim.api.nvim_get_runtime_file("", true),
					},
					-- Do not send telemetry data containing a randomized but unique identifier
					telemetry = {
						enable = false,
					},
				},
			},
		})
	end

	if is_enabled("markdown") then
		vim.g.neoformat_enabled_markdown = { "prettier" }
	end
	if is_enabled("python") then
		require("lspconfig").pyright.setup({
			capabilities = capabilities,
		})
	end

	if require("core.utils").get("format_on_save") then
		vim.api.nvim_exec(
			[[
augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END
]],
			true
		)
	end
end

return M
