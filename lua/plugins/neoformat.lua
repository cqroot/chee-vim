local M = {}

function M.load()
    vim.g.neoformat_enabled_c = { "clangformat" }
    vim.g.neoformat_enabled_cmake = { "cmakeformat" }
    vim.g.neoformat_enabled_go = { "gofumpt" }
    vim.g.neoformat_enabled_lua = { "stylua" }
    vim.g.neoformat_enabled_markdown = { "prettier" }
    vim.g.neoformat_enabled_python = { "black" }
    vim.g.neoformat_enabled_sh = { "shfmt" }
    vim.g.neoformat_enabled_toml = { "taplo" }
end

return M
