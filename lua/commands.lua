vim.cmd("command! SudoWrite :execute ':silent w !sudo tee % > /dev/null' | :edit!")
