local M = {}

function M.editor_LineNumber()
    return require("core.utils").get("editor_LineNumber")
end

function M.editor_CursorLine()
    return require("core.utils").get("editor_CursorLine")
end

function M.editor_CursorColumn()
    return require("core.utils").get("editor_CursorColumn")
end

function M.editor_FormatOnSave()
    return require("core.utils").get("editor_FormatOnSave")
end

function M.editor_ImSwitch()
    return require("core.utils").get("editor_ImSwitch")
end

function M.workbench_ColorScheme()
    return require("core.utils").get("workbench_ColorScheme")
end

function M.git_CurrentLineBlame()
    return require("core.utils").get("git_CurrentLineBlame")
end

function M.markdown_PreviewBrowser()
    return require("core.utils").get("markdown_PreviewBrowser")
end

return M
