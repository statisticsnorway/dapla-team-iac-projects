#!/usr/bin/env bash

source "$(dirname "$0")/_support-functions.sh"

function get_dapla_team_repos {
    gh repo list statisticsnorway --topic dapla-team --json name | jq -r '.[].name'
}

dapla_team_repos=$(get_dapla_team_repos)

for repo in ${dapla_team_repos}; do
    if [ -d ${repo} ];
    then
      cd ${repo}

      terraform fmt -check
      terraform fmt -recursive
      
      cd ..
    else
      echo "${repo} $(red not found...) You should probably run 'make update-all'"
    fi
done
