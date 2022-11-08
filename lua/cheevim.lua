local M = {}

function M.init()
	require("core.options").load()
	require("plugins").load()
	require("plugins.cmp").load()

	require("core.mappings").load()
	if require("core.utils").get("editor_im_switch") == "fcitx" then
		require("core.im_fcitx").load()
	end
end

return M
