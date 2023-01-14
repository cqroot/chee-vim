local M = {}

function M.load()
    require("Comment").setup({
        toggler = {
            line = "<C-_>",
            block = "gbc",
        },
        opleader = {
            line = "<C-_>",
            block = "gb",
        },
    })
end

return M
