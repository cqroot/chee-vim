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

function M.get_key(action)
	local ok, _ = pcall(require, "custom_keys")
	if ok then
		local key = require("custom_keys")[action]
		if key ~= nil then
			return key
		end
	end

	return nil
end

return M
