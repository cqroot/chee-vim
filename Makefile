.PHONY: generate
generate:
	bash scripts/generate.sh > $(CURDIR)/lua/core/options.lua
