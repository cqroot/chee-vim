local M = {}

local function setup_line_number()
    local line_number = require("core.options").editor_LineNumber()
    if line_number == false then
        vim.opt.number = false
    elseif line_number == "relative" then
        vim.opt.relativenumber = true
    else
        vim.opt.number = true
    end
end

local function setup_cursor()
    vim.opt.cursorline = require("core.options").editor_CursorLine()
    vim.opt.cursorcolumn = require("core.options").editor_CursorColumn()
end

local function setup_im_switch()
    if require("core.options").editor_ImSwitch() == "fcitx" then
        require("core.im_fcitx").load()
    end
end

function M.load()
    vim.opt.mouse = "a"
    vim.opt.ignorecase = true
    vim.opt.wildignorecase = true

    vim.opt.backup = false
    vim.opt.writebackup = false
    vim.opt.swapfile = false

    vim.opt.smarttab = false
    vim.opt.smartindent = true
    vim.opt.autoindent = true
    vim.opt.expandtab = false
    vim.opt.tabstop = 4
    vim.opt.softtabstop = 4
    vim.opt.shiftwidth = 4

    vim.opt.termguicolors = true
    vim.opt.colorcolumn = { 80, 120 }

    vim.opt.conceallevel = 0
    vim.opt.list = true
    vim.opt.listchars = {
        space = "·",
        tab = "»·",
        trail = "·",
        nbsp = "·",
        eol = "↴",
    }
    vim.opt.completeopt = { "menu", "menuone", "noselect" }

    setup_line_number()
    setup_cursor()
    setup_im_switch()
end

return M
