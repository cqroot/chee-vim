local M = {}

function M.load()
	local get_key = require("core.utils").get_key

	-- Window
	vim.api.nvim_set_keymap("n", get_key("win_left"), "<C-w>h", { noremap = true, silent = true })
	vim.api.nvim_set_keymap("n", get_key("win_down"), "<C-w>j", { noremap = true, silent = true })
	vim.api.nvim_set_keymap("n", get_key("win_up"), "<C-w>k", { noremap = true, silent = true })
	vim.api.nvim_set_keymap("n", get_key("win_right"), "<C-w>l", { noremap = true, silent = true })

	-- Buffer
	vim.api.nvim_set_keymap("n", get_key("buf_close"), ":bp|bd #<CR>", { noremap = true, silent = true })
	vim.api.nvim_set_keymap("n", get_key("buf_prev"), ":bp!<CR>", { noremap = true, silent = true })
	vim.api.nvim_set_keymap("n", get_key("buf_next"), ":bn!<CR>", { noremap = true, silent = true })

	-- Format
	vim.api.nvim_set_keymap("n", get_key("format"), ":Neoformat<CR>", { noremap = true, silent = true })

	-- Sidebar
	vim.api.nvim_set_keymap(
		"n",
		get_key("toggle_explorer"),
		":NeoTreeShowToggle<CR>",
		{ noremap = true, silent = true }
	)
	vim.api.nvim_set_keymap("n", get_key("toggle_outline"), ":SymbolsOutline<CR>", { noremap = true, silent = true })

	-- Git
	vim.api.nvim_set_keymap("n", get_key("git_diff"), ":Gitsigns diffthis<CR>", { noremap = true, silent = true })

	-- Comment
	vim.api.nvim_set_keymap("n", get_key("comment"), "<Plug>NERDCommenterToggle", { noremap = true, silent = true })
	vim.api.nvim_set_keymap("x", get_key("comment"), "<Plug>NERDCommenterToggle", { noremap = true, silent = true })
end

return M
