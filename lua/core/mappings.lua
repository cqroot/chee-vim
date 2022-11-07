local M = {}

function M.load()
	local opts = { noremap = true, silent = true }
	local get_key = require("core.utils").get_key

	local nmaps = {
		-- Core
		source_rc = ":luafile $MYVIMRC<CR>",
		-- Window
		win_left = "<C-w>h",
		win_down = "<C-w>j",
		win_up = "<C-w>k",
		win_right = "<C-w>l",
		-- Buffer
		buf_close = ":bp|bd #<CR>",
		buf_prev = ":bp!<CR>",
		buf_next = ":bn!<CR>",
		-- Format
		format = ":Neoformat<CR>",
		-- Sidebar
		toggle_explorer = ":Neotree toggle<CR>",
		toggle_outline = ":AerialToggle<CR>",
		-- Git
		git_diff = ":Gitsigns diffthis<CR>",
		-- Comment
		comment = "<Plug>NERDCommenterToggle",
	}

	local xmaps = {
		-- Comment
		comment = "<Plug>NERDCommenterToggle",
	}

	for k, v in pairs(nmaps) do
		local key = get_key(k)
		if key ~= nil and key ~= "" then
			vim.api.nvim_set_keymap("n", get_key(k), v, opts)
		end
	end

	for k, v in pairs(xmaps) do
		local key = get_key(k)
		if key ~= nil and key ~= "" then
			vim.api.nvim_set_keymap("x", get_key(k), v, opts)
		end
	end

	vim.keymap.set("n", "<M-p>", require("core.menu").show_menu, opts)
end

return M
