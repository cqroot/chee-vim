local M = {}

function M.load()
	local opts = { noremap = true, silent = true }
	local get_key = require("core.utils").get_key

	local nmaps = {
		-- Core
		source_rc = "<cmd>luafile $MYVIMRC<cr>",
		show_menu = require("core.menu").show_menu,
		-- Buffer
		buf_close = "<cmd>bp|bd #<cr>",
		buf_prev = "<cmd>bp!<cr>",
		buf_next = "<cmd>bn!<cr>",
		-- Format
		format = function()
			vim.lsp.buf.format({ bufnr = bufnr })
		end,
		-- Sidebar
		toggle_explorer = "<cmd>Neotree toggle<cr>",
		toggle_outline = "<cmd>AerialToggle<cr>",
		-- Git
		git_diff = "<cmd>Gitsigns diffthis<cr>",
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
			vim.keymap.set("n", key, v, opts)
		end
	end

	for k, v in pairs(xmaps) do
		local key = get_key(k)
		if key ~= nil and key ~= "" then
			vim.keymap.set("x", key, v, opts)
		end
	end
end

return M
