# Dapla Team IaC Projects

Gather all Dapla Team IaC projects in a common root.


## Functionality

* Discover and check out all dapla-team iac repos from github
* Retrieve a basic overview of modules and versions used by Dapla Team IaC repos

## Makefile

Use make to execute tasks 

```
install-tools                  Install required tooling
doctor                         Sanity check of required tools and environment settings
update-all                     Clone or pull all changes from Dapla Team IaC repos
tf-module-versions-current     For each IaC repo, list all tf modules and versions
```

## Required exernal tools

* [terraform-module-versions](https://github.com/keilerkonzept/terraform-module-versions)


## IntelliJ setup

To view all sub folders correctly in IntelliJ select the menu `IntelliJ IDEA` -> `Preferences...` 
Then choose Directory Mappings under Version Control as shown below:

<img src="/Users/bjornandre/code/ssb/mod-sirius/dapla-team-iac-projects/images/idea-directory-mappings.png" height="50%" width="50%"/>

Select all sub folders that are listed as Unregistered Roots and select `Add`:

<img src="/Users/bjornandre/code/ssb/mod-sirius/dapla-team-iac-projects/images/idea-directory-mappings-add.png" height="50%" width="50%"/>

Now you should be able to commit changes for each individual IaC repository into GitHub.