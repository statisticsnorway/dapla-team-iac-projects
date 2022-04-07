.PHONY: default
default: | help

.PHONY: update-all
update-all: ## Clone or pull all changes from Dapla Team IaC repos
	@./bin/git-update.sh

.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
