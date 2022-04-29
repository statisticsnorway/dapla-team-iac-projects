# Dapla Team IaC Projects

Gather all Dapla Team IaC projects in a common root.


## Functionality

* Discover and check out all dapla-team iac repos from github
* Retrieve a basic overview of modules and versions used by Dapla Team IaC repos
* Run common Terraform commands on all repos
* Ability to batch branching and pull request for all repos simultaneously

## Makefile

Use make to execute tasks 

```
doctor                         Sanity check of required tools and environment settings
update-all                     Clone or pull all changes from Dapla Team IaC repos
git-pr-all                     For each IaC repo create a pull request with changes
tf-format-all                  For each IaC repo run Terraform formatting
tf-module-versions-current     For each IaC repo, list all tf modules and versions
```

## Required external tools

* [terraform-module-versions](https://github.com/keilerkonzept/terraform-module-versions)
* [GitHub CLI](https://cli.github.com/)

## TODO
* Update all repos to use Dapla Atlantis Terraform state
