.PHONY: bootstrap
bootstrap:
	bash $(CURDIR)/scripts/bootstrap.sh

.PHONY: format
format:
	stylua $(CURDIR)/init.lua lua/
