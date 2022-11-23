-- Reference https://github.com/yamatsum/nvim-cursorline

local M = {}

local function matchadd()
	local column = vim.api.nvim_win_get_cursor(0)[2]
	local line = vim.api.nvim_get_current_line()
	local cursorword = vim.fn.matchstr(line:sub(1, column + 1), [[\k*$]])
		.. vim.fn.matchstr(line:sub(column + 1), [[^\k*]]):sub(2)

	if cursorword == vim.w.cursorword then
		return
	end
	vim.w.cursorword = cursorword
	if vim.w.cursorword_id then
		vim.call("matchdelete", vim.w.cursorword_id)
		vim.w.cursorword_id = nil
	end
	if cursorword == "" or #cursorword > 100 or #cursorword < 3 or string.find(cursorword, "[\192-\255]+") ~= nil then
		return
	end
	local pattern = [[\<]] .. cursorword .. [[\>]]
	vim.w.cursorword_id = vim.fn.matchadd("CursorWord", pattern, -1)
end

function M.load()
	vim.api.nvim_create_autocmd("VimEnter", {
		callback = function()
			vim.api.nvim_set_hl(0, "CursorWord", { underline = true })
			matchadd()
		end,
	})
	vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
		callback = function()
			matchadd()
		end,
	})
end

M.options = nil

return M
