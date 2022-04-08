#!/usr/bin/env bash

# Sanity check of required tools and environment settings
# This script exits with status code=0 if everything is aye-okay
source "$(dirname "$0")/_support-functions.sh"

function validate_localstack_env {
    validate_silently "make --version" "make is not installed" || return 1
    validate_silently "jq --version" "jq is not installed" || return 1
    validate_silently "terraform-module-versions --help" "terraform-module-versions is not installed" || return 1
    #validate_silently "go version" "go is not installed" || return 1
    #validate_env GITHUB_TOKEN "Should hold your github auth token" || return 1

    echo "Hooray! You seem to be $(green healthy)"
}

if [ -z $SKIP_EXEC ]
then
    validate_localstack_env
fi