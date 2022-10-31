local M = {}

function M.load()
	vim.g.NERDDefaultAlign = "left"
	vim.g.NERDSpaceDelims = 1
	vim.g.NERDCustomDelimiters = {
		python = { left = "#" },
	}
	vim.g.NERDToggleCheckAllLines = 1
end

return M
