#!/usr/bin/env bash

# Load the main plugins "interface"
source "${HOME}/.oh-my-zsh/plugins/beamery/pluginsInterface.zsh"

# audit_git_branches
# List all the branches of a .git repository sorted by date creation
# This is useful to identify dead branches

audit_git_branches() {
	execute -g $@ "echo ""; git branch -vv";

	printf "${YELLOW}\nHistorical Branches Data:\n${NC}";
    execute -g $@ "echo""; git for-each-ref --sort='-authordate:iso8601' --format=' %(authordate:relative)%09%(refname:short)' refs/remotes"
}
