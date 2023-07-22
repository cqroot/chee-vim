local M = {}

function M.load()
    require("aerial").setup({
        show_guides = true,
        layout = {
            max_width = { 100, 0.4 },
            width = nil,
            min_width = 30,
        },
    })
end

return M
