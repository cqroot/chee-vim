local M = {}

function M.load()
    require("mason-lspconfig").setup({
        automatic_installation = true,
    })
end

return M
