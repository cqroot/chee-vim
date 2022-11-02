vim.g.python_host_skip_check = 1
vim.g.python_host_prog = "/usr/bin/python"
vim.g.python3_host_skip_check = 1
vim.g.python3_host_prog = "/usr/bin/python3"

require("core.options").load()
require("core.mappings").load()
require("plugins").load()

require("plugins.completion").load()
