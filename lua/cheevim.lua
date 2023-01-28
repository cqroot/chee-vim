local M = {}

function M.init()
    require("core.setup").load()

    require("plugins").load()
    require("plugins.cmp").load()

    require("core.mappings").load()
    require("core.after_plugins").load()
end

return M
