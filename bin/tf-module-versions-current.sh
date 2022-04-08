#!/usr/bin/env bash

source "$(dirname "$0")/_support-functions.sh"

for repo in $(local_iac_repos); do    
    printf "\n"$(bold $repo)"\n"
    terraform-module-versions -o json list $repo | yq -P
done
