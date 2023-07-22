.PHONY: bootstrap
bootstrap:
	bash '$(CURDIR)/scripts/bootstrap.sh'

.PHONY: clean
clean:
	rm -rf '$(CURDIR)/config/options.sh'
	rm -rf '$(CURDIR)/lua/generated_options.lua'

.PHONY: format
format:
	stylua '$(CURDIR)/init.lua' 'lua/'
