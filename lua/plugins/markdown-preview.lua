local M = {}

local get_option = require("core.utils").get

function M.load()
	vim.g.mkdp_auto_close = 0
	vim.g.mkdp_browser = get_option("markdown_preview_browser")
end

return M
