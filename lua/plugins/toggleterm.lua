local M = {}

function M.load()
    -- vim.cmd("if has('win32') | let &shell = 'pwsh' | endif")
    vim.cmd([[
        if has('win32')
            let &shell = '"C:/Program Files/Git/bin/bash.exe"'
            let &shellcmdflag = '-c'

            " let &shell = 'pwsh'
            " let &shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;'
            " let &shellredir = '-RedirectStandardOutput %s -NoNewWindow -Wait'
            " let &shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'

            set shellquote=
        endif
    ]])

    require("toggleterm").setup({
        float_opts = {
            border = "curved",
        },
    })
end

return M
