local M = {}

function M.load()
    require("symbols-outline").setup({
        width = 20,
        keymaps = { -- These keymaps can be a string or a table for multiple keys
            close = { "q" },
        },
    })

    vim.cmd("autocmd BufEnter * if (winnr(\"$\") == 1 && &filetype == 'Outline') | q | endif")
end

return M
