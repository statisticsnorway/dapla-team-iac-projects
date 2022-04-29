#!/usr/bin/env bash

source "$(dirname "$0")/_support-functions.sh"

function get_dapla_team_repos {
    gh repo list statisticsnorway --topic dapla-team --json name | jq -r '.[].name'
}

dapla_team_repos=$(get_dapla_team_repos)
links_to_prs=()

read -r -p "Name the branch: " branch_name
read -r -p "Commit message: " commit_message

for repo in ${dapla_team_repos}; do
    if [ -d ${repo} ];
    then
      cd ${repo}

      has_uncommitted_changes_output=$(git status --porcelain)

      if [ "$has_uncommitted_changes_output" != '' ]; then
        original_branch=$(git branch --show-current)

        git checkout -b "$branch_name"
        git add .
        git commit -m "$commit_message"
        git push -u origin "$branch_name"

        sleep 1

        pr_url=$(gh pr create --fill | tail -1)
        links_to_prs+=("$pr_url")

        git checkout "$original_branch"

        echo "Pull request created for ${repo} - $(green OK)"
      fi

      cd ..
    else
      echo "${repo} $(red not found...) You should probably run 'make update-all'"
    fi
done

if [ ${#links_to_prs[@]} != 0 ]; then
  echo "Links to the generated Pull Requests:"

  for i in "${links_to_prs[@]}"; do
    echo "$i"
  done
fi
