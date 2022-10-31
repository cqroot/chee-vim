local M = {}

function M.load()
	vim.opt.number = true
	vim.opt.mouse = ""
	vim.opt.ignorecase = true
	vim.opt.wildignorecase = true

	vim.opt.expandtab = true
	vim.opt.smarttab = true
	vim.opt.smartindent = true
	vim.opt.autoindent = true
	vim.opt.tabstop = 4
	vim.opt.softtabstop = 4
	vim.opt.shiftwidth = 4

	vim.opt.termguicolors = true

	vim.opt.list = true
	vim.opt.listchars = {
		tab = "»·",
		trail = "·",
		nbsp = "·",
		eol = "↴",
	}
    vim.opt.completeopt = { "menu", "menuone", "noselect" }

	pcall(vim.cmd.colorscheme, require("core.utils").get("colorscheme"))
end

return M
