local M = {}

function M.load()
    require("gitsigns").setup({
        current_line_blame = true,
    })
end

return M
