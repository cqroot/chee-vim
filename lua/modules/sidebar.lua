local M = {}

function M.load()
	-- disable netrw at the very start of your init.lua (strongly advised)
	vim.g.loaded_netrw = 1
	vim.g.loaded_netrwPlugin = 1

	-- OR setup with some options
	require("nvim-tree").setup({
		sort_by = "case_sensitive",
		view = {
			adaptive_size = true,
			mappings = {
				list = {
					{ key = "u", action = "dir_up" },
					{ key = "l", action = "edit", action_cb = edit_or_open },
					{ key = "L", action = "vsplit_preview", action_cb = vsplit_preview },
					{ key = "h", action = "close_node" },
					{ key = "H", action = "collapse_all", action_cb = collapse_all },
					{ key = ".", action = "toggle_dotfiles" },
					{ key = "<CR>", action = "cd" },
					{ key = "<BS>", action = "dir_up" },
				},
			},
		},
		renderer = {
			group_empty = true,
		},
		filters = {
			dotfiles = true,
		},
	})

	vim.cmd("autocmd BufEnter * if (winnr(\"$\") == 1 && &filetype == 'NvimTree') | q | endif")
	vim.cmd("autocmd BufEnter * if (winnr(\"$\") == 1 && &filetype == 'Outline') | q | endif")
end

return M
