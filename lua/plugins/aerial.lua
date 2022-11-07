local M = {}

function M.load()
	require("aerial").setup({
		show_guides = true,
	})
end

return M
