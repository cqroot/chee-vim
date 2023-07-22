local M = {}

function M.load()
    local actions = require("telescope.actions")

    require("telescope").setup({
        defaults = {
            mappings = {
                i = {
                    ["<esc>"] = actions.close,
                },
            },
        },
    })
end

return M
