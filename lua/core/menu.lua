local M = {}

function M.show_menu()
	local Menu = require("nui.menu")
	-- local event = require("nui.utils.autocmd").event

	local menu = Menu({
		position = "50%",
		size = {
			width = 30,
			height = 8,
		},
		border = {
			style = "single",
			text = {
				top = " Actions ",
				top_align = "center",
			},
		},
		win_options = {
			winhighlight = "Normal:Normal,FloatBorder:Normal",
		},
	}, {
		lines = {
			Menu.item("Source vimrc"),
			Menu.item("Git: diff this"),
			Menu.item("View: toggle file-explorer"),
			Menu.item("View: toggle outline"),
		},
		max_width = 20,
		keymap = {
			focus_next = { "j", "<Down>", "<Tab>" },
			focus_prev = { "k", "<Up>", "<S-Tab>" },
			close = { "<Esc>", "<C-c>", "q" },
			submit = { "<CR>", "<Space>" },
		},
		on_submit = function(item)
			if item.text == "Source vimrc" then
				vim.cmd.luafile("$MYVIMRC")
			elseif item.text == "Git: diff this" then
				require("gitsigns").diffthis()
			elseif item.text == "View: toggle file-explorer" then
				vim.cmd("Neotree toggle")
			elseif item.text == "View: toggle outline" then
				vim.cmd("AerialToggle")
			end
		end,
	})

	-- mount the component
	menu:mount()
end

return M
