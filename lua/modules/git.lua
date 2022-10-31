local M = {}

get_option = require("core.utils").get

function M.load()
	require("gitsigns").setup({
		current_line_blame = get_option("git_current_line_blame"),
	})
end

return M
