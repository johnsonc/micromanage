#!/usr/bin/env bash

# Load the main plugins "interface"
source "${HOME}/.oh-my-zsh/plugins/beamery/pluginsInterface.zsh"

# track_all_remote_git_branches
# Track all remote branches that are not being tracked locally

track_all_remote_git_branches() {
    execute -g $@ git branch -r | grep -v '\->' | while read remote; do git branch --track ${remote#origin/} $remote > /dev/null; done
    echo "--> All remote branches tracked"
}

