local M = {}

function M.load()
    vim.cmd("command! SudoWrite :execute ':silent w !sudo tee % > /dev/null' | :edit!")
end

return M
