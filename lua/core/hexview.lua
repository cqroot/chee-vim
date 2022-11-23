local M = {}

M.hexview = function()
	local src_buf = vim.api.nvim_get_current_buf()
	local dst_buf = vim.api.nvim_create_buf(false, true)
	vim.api.nvim_buf_set_option(dst_buf, "bufhidden", "wipe")
	vim.api.nvim_buf_set_lines(dst_buf, 0, -1, false, vim.api.nvim_buf_get_lines(src_buf, 0, -1, false))
	vim.api.nvim_win_set_buf(0, dst_buf)
	vim.cmd("%!xxd")

	local ns = vim.api.nvim_create_namespace("range-highlight")
	local hexgroup = vim.api.nvim_create_augroup("hex", { clear = true })
	vim.api.nvim_create_autocmd({ "CursorMoved" }, {
		group = hexgroup,
		buffer = dst_buf,
		callback = function()
			vim.api.nvim_buf_clear_namespace(0, ns, 0, -1)

			local hl_str = "Search"
			local current_cur_pos = vim.api.nvim_win_get_cursor(0)
			local col = current_cur_pos[2]

			if col < 10 or col > 50 then
				return
			end
			col = col - 10
			local sub_col = col % 5
			local sub_group = (col - sub_col) / 5
			local c_line = 51 + sub_group * 2

			if sub_col == 4 then
				return
			end

			-- if sub_col == 0 or sub_col == 2 then
			--     vim.highlight.range(
			--         vim.api.nvim_get_current_buf(),
			--         ns,
			--         "Cursor",
			--         { current_cur_pos[1] - 1, current_cur_pos[2] + 1 },
			--         { current_cur_pos[1] - 1, current_cur_pos[2] + 2 }
			--     )
			-- else
			--     vim.highlight.range(
			--         vim.api.nvim_get_current_buf(),
			--         ns,
			--         "Cursor",
			--         { current_cur_pos[1] - 1, current_cur_pos[2] - 1 },
			--         { current_cur_pos[1] - 1, current_cur_pos[2] }
			--     )
			-- end

			vim.highlight.range(
				vim.api.nvim_get_current_buf(),
				ns,
				hl_str,
				{ current_cur_pos[1] - 1, c_line + math.floor(sub_col / 2) },
				{ current_cur_pos[1] - 1, c_line + math.floor(sub_col / 2) + 1 }
			)
		end,
	})
end

return M
