local M = {}

local function get_option(option)
    local ok, _ = pcall(require, "custom_options")
    if ok then
        local value = require("custom_options")[option]
        if value ~= nil then
            return value
        end
    end

    return require("default_options")[option]
end

function M.editor_LineNumber()
    return get_option("editor_LineNumber")
end

function M.editor_CursorLine()
    return get_option("editor_CursorLine")
end

function M.editor_CursorColumn()
    return get_option("editor_CursorColumn")
end

function M.editor_FormatOnSave()
    return get_option("editor_FormatOnSave")
end

function M.editor_ImSwitch()
    return get_option("editor_ImSwitch")
end

function M.workbench_ColorScheme()
    return get_option("workbench_ColorScheme")
end

function M.git_CurrentLineBlame()
    return get_option("git_CurrentLineBlame")
end

function M.markdown_PreviewBrowser()
    return get_option("markdown_PreviewBrowser")
end

return M
