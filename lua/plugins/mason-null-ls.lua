local M = {}

function M.load()
    require("mason-null-ls").setup({
        automatic_installation = true,
    })
end

return M
