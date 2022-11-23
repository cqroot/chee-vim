local M = {}

function M.get(option)
	local ok, _ = pcall(require, "custom_options")
	if ok then
		local value = require("custom_options")[option]
		if value ~= nil then
			return value
		end
	end

	return require("core.default_options")[option]
end

return M
