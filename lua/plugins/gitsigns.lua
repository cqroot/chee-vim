local M = {}

function M.load()
    require("gitsigns").setup({
        current_line_blame = require("core.options").git_CurrentLineBlame(),
    })
end

return M
