vim.g.python_host_skip_check = 1
vim.g.python_host_prog = "/usr/bin/python"
vim.g.python3_host_skip_check = 1
vim.g.python3_host_prog = "/usr/bin/python3"

require("options").load()
require("plugins").load()
require("plugins.cmp").load()
require("commands").load()
require("mappings").load()

-- "onedark" "zenbones" "ayu-mirage" "vscode"
pcall(vim.cmd, "colorscheme onedark")
