local M = {}

function M.load()
    vim.g.mkdp_auto_close = 0
    vim.g.mkdp_browser = require("core.options").markdown_PreviewBrowser()
end

return M
