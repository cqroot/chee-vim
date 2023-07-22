#!/usr/bin/env bash

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
ROOT_DIR=$(dirname "${SCRIPT_DIR}")
CONFIG_DIR=${ROOT_DIR}/config
OPTIONS_FILE=${ROOT_DIR}/lua/generated_options.lua

function add_config() {
	echo "$1" >>"${OPTIONS_FILE}"
}

function bootstrap() {
	if [ -f "${CONFIG_DIR}/options.sh" ]; then
		source "${CONFIG_DIR}/options.sh"
	fi

	echo '' >"${OPTIONS_FILE}"

	if [ "${ExpandTab:-1}" -eq 0 ]; then
		add_config 'vim.opt.expandtab = false'
	else
		add_config 'vim.opt.expandtab = true'
	fi
}

bootstrap
