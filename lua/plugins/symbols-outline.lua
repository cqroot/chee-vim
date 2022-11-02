local M = {}

function M.load()
	require("symbols-outline").setup()

	vim.cmd("autocmd BufEnter * if (winnr(\"$\") == 1 && &filetype == 'Outline') | q | endif")
end

return M
