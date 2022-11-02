local M = {}

function M.load()
	require("bufferline").setup({
		options = {
			offsets = { { filetype = "neo-tree", text = " ", padding = 0 } },
			show_buffer_close_icons = false,
			show_close_icon = false,
			indicator = {
				icon = "│",
			},
		},
	})
end

return M
