#!/usr/bin/env bash

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
ROOT_DIR=$(dirname "${SCRIPT_DIR}")
CONFIG_DIR=${ROOT_DIR}/config

OPTS_SH_PATH=${CONFIG_DIR}/options.sh
GEN_OPTS_LUA_PATH=${ROOT_DIR}/lua/generated_options.lua

function add_config() {
	echo "$1" >>"${GEN_OPTS_LUA_PATH}"
}

function bootstrap() {
	if [ ! -f "${OPTS_SH_PATH}" ]; then
		ln -s "${CONFIG_DIR}/options-sample.sh" "${OPTS_SH_PATH}"
	fi

	if [ -f "${OPTS_SH_PATH}" ]; then
		source "${OPTS_SH_PATH}"
	fi

	echo '' >"${GEN_OPTS_LUA_PATH}"

	# **************************************************
	# * Options                                        *
	# **************************************************
	if [ "${ExpandTab:-1}" -eq 0 ]; then
		add_config 'vim.opt.expandtab = false'
	else
		add_config 'vim.opt.expandtab = true'
	fi

	if [ "${CSyntaxForH:-0}" -eq 0 ]; then
		add_config 'vim.g.c_syntax_for_h = 0'
	else
		add_config 'vim.g.c_syntax_for_h = 1'
	fi
}

bootstrap
