local M = {}

function M.load()
    pcall(vim.cmd, "colorscheme " .. require("core.options").workbench_ColorScheme())

    pcall(vim.cmd, "Neotree show")
end

return M
