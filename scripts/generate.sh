#!/bin/bash

SCRIPT_PATH=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
ROOT_PATH=$(dirname "$SCRIPT_PATH")

main() {
	local default_options_lua="$ROOT_PATH/lua/default_options.lua"

    echo 'local M = {}'
    echo

	while read -r line; do
		if [[ $line == M.* ]]; then
			local option
            option=$(echo "$line" | sed -n 's/^M\.\(.*\)\(=.*\)$/\1/p' | xargs)

            echo "function M.$option()"
            echo "    return require(\"core.utils\").get(\"$option\")"
            echo "end"
            echo
		fi
	done <"$default_options_lua"

    echo 'return M'
}

main
