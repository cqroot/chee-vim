local M = {}

function M.load()
    pcall(vim.cmd, "colorscheme " .. require("core.options").workbench_ColorScheme())
end

return M
