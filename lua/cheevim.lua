local M = {}

function M.init()
	require("core.options").load()
	require("core.mappings").load()
	require("plugins").load()
end

return M
