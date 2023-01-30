vim.g.python_host_skip_check = 1
vim.g.python_host_prog = "/usr/bin/python"
vim.g.python3_host_skip_check = 1
vim.g.python3_host_prog = "/usr/bin/python3"

for pkg, _ in pairs(package.loaded) do
    if pkg:find("core.", 1, true) == 1
        or pkg:find("plugins.", 1, true) == 1
        or pkg:find("custom_", 1, true)
        or pkg == "cheevim"
    then
        package.loaded[pkg] = nil
    end
end

require("cheevim").init()

vim.cmd("command! SudoWrite :execute ':silent w !sudo tee % > /dev/null' | :edit!")
