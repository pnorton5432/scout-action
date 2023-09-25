#!/bin/bash
set -euxo pipefail

pushd ~/IdeaProjects/scout-cli-plugin
	task go:build:action
popd

cp ../scout-cli-plugin/dist/github-action ./dist/docker-scout-action_linux_amd64
git add ./dist/docker-scout-action_linux_amd64
git commit -m "update scout-cli" 
git tag -s -f -m testing testing HEAD 
git push --follow-tags

