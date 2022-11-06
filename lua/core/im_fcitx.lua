local M = {}

local function fcitx_inactivate()
	local input_status = vim.fn.system({ "fcitx-remote" })

	if input_status == "2\n" then
		vim.fn.system({ "fcitx-remote", "-c" })
		input_status = vim.fn.system({ "fcitx-remote" })
	end
end

local function fcitx_activate()
	local input_status = vim.fn.system({ "fcitx-remote" })

	if input_status == "1\n" then
		vim.fn.system({ "fcitx-remote", "-o" })
		input_status = vim.fn.system({ "fcitx-remote" })
	end
end

function M.load()
	vim.api.nvim_create_autocmd({ "InsertEnter" }, {
		callback = fcitx_inactivate,
	})

	vim.api.nvim_create_autocmd({ "InsertLeave" }, {
		callback = fcitx_activate,
	})
end

return M
