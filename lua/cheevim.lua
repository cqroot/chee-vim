local M = {}

function M.init()
	require("core.options").load()
	require("core.mappings").load()
	require("plugins").load()
	require("plugins.cmp").load()
end

return M
