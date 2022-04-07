#!/usr/bin/env bash

function get_dapla_team_repos {
    gh repo list statisticsnorway --topic dapla-team --json name | jq -r '.[].name'
}

function update {
    printf "Updating ${2}... "
    output=$(git -C ${1}/ pull --rebase 2>&1)
    handle_response
}

function clone {
    printf "Cloning $1... "
    output=$(git clone git@github.com:statisticsnorway/${1}.git 2>&1)
    handle_response
}

function green {
    printf '\e[32m%s\e[0m' "$1"
}

function red {
    printf '\e[31m%s\e[0m' "$1"
}

function handle_response {
    if [ $? -eq 0 ]
    then
        case "$output" in
            *"up-to-date"*)
                echo $(green "Already up-to-date")
                ;;
            *"Cloning"*)
                echo $(green "OK")
                ;;
            *)
                echo $(green "OK")
                printf "$output\n\n"
                ;;
        esac
    else
        echo $(red "ERROR")
        printf "$output\n\n"
    fi
}

dapla_team_repos=$(get_dapla_team_repos)

for repo in ${dapla_team_repos}; do
    if [ -d ${repo} ];
    then
        update ${repo}
    else
        clone ${repo}
    fi
done 
