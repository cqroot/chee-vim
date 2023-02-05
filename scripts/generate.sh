#!/bin/bash

SCRIPT_PATH=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
ROOT_PATH=$(dirname "$SCRIPT_PATH")

main() {
	local default_options_lua="$ROOT_PATH/lua/default_options.lua"

	echo 'local M = {}

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
'

	while read -r line; do
		if [[ $line == M.* ]]; then
			local option
			option=$(echo "$line" | sed -n 's/^M\.\(.*\)\(=.*\)$/\1/p' | xargs)

			echo "function M.$option()"
			echo "    return get_option(\"$option\")"
			echo "end"
			echo
		fi
	done <"$default_options_lua"

	echo 'return M'
}

main
