#!/bin/bash

release=$(curl -s "https://api.github.com/repos/$CIRCLE_PROJECT_USERNAME/$CIRCLE_PROJECT_REPONAME/releases")
tag=$(jq -r ".[0].tag_name")
tag_name=$(jq -r ".[0].name")

if [[ -n "$tag_name" ]]; then
    echo "export RELEASE_NAME=$tag_name"
    exit 0
fi

echo "export RELEASE_NAME=$tag"
