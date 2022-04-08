.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: default
default: | help

.PHONY: doctor
doctor: ## Sanity check of required tools and environment settings
	@./bin/doctor.sh

.PHONY: update-all
update-all: ## Clone or pull all changes from Dapla Team IaC repos
	@./bin/git-update.sh

.PHONY: tf-module-versions-current
tf-module-versions-current: ## For each IaC repo, list all tf modules and versions
	@./bin/tf-module-versions-current.sh
