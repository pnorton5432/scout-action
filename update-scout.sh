#!/bin/bash
set -euxo pipefail

pushd ~/IdeaProjects/scout-cli-plugin
	go-task go:build:action
popd

cp ../scout-cli-plugin/dist/github-action ./dist/docker-scout-action_linux_amd64
git add .
git commit --amend -m "update scout-cli"
git tag -s -f -m testing testing HEAD 
git push --force
git push --tags --force

