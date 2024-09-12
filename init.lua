vim.g.python_host_skip_check = 1
vim.g.python_host_prog = "/usr/bin/python"
vim.g.python3_host_skip_check = 1
vim.g.python3_host_prog = "/usr/bin/python3"

vim.g.mapleader = ";"

require("options")
require("plugins")
require("plugins.cmp")
require("commands")
require("mappings")

-- "onedark" "zenbones" "ayu-mirage" "vscode"
-- pcall(vim.cmd, "colorscheme vscode")
-- pcall(vim.cmd, "colorscheme kanagawa-dragon")
pcall(vim.cmd, "colorscheme onedark")

vim.api.nvim_set_hl(0, "MiniCursorword", { bg = "#3b4261" })
vim.api.nvim_set_hl(0, "MiniCursorwordCurrent", { bg = "#3b4261" })
