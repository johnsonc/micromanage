export SOURCE_LOCATION=`pwd`

# Prompt user to select his type of shell
printf "
Please select what shell helper you need to install the plugins for (bash-it | oh-my-zsh) or other for independent installation:
" && read SHELL_TYPE

install_manually() {


	# We need to makre sure that we have a .beamery folder in home
	[ -d ${HOME}/.beamery ] || sudo mkdir "$HOME/.beamery"

    sudo ln -sf "${SOURCE_LOCATION}/beamery" "${HOME}/.beamery"

    # Getting the user's OS type in order to load the correct installation and configuration scripts
    if [[ "$OSTYPE" == "linux-gnu" ]]; then
        printf "\n%s\n" "source $HOME/.beamery/beamery/beamery.sh" >> "${HOME}/.bashrc"
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        printf "\n%s\n" "source '$HOME/.beamery/beamery/beamery.sh'" >> "${HOME}/.bash_profile"
    fi

    printf "Do not forget now to enable the plugin by sourcing your bash_profile or bashrc"
}

if [[ "$SHELL_TYPE" == "bash-it" ]]; then

    if [[ -d ${HOME}/.bash_it ]]; then
        ln -sf "${SOURCE_LOCATION}/bash-it/beamery.completion.bash" "${HOME}/.bash_it/completion/available"
        ln -sf "${SOURCE_LOCATION}/bash-it/beamery.plugin.bash" "${HOME}/.bash_it/plugins/available"
        ln -sf "${SOURCE_LOCATION}/bash-it/beamery" "${HOME}/.bash_it/plugins/available"
    else
        printf "We noticed that bash-it is not installed .. installing the plugins manually" && install_manually
    fi

    printf "
    Do not forget now to enable completion and plugins by reloading shell first by resourcing your bash_profile or bashrc and then executing:

    bash-it enable completion beamery
    bash-it enable plugin beamery

    "

elif [[ "$SHELL_TYPE" == "oh-my-zsh" ]]; then
    if [[ -d ${HOME}/.oh-my-zsh ]]; then
        ln -sf "${SOURCE_LOCATION}/zsh/beamery" "${HOME}/.oh-my-zsh/plugins/"
    else
        printf "We noticed that oh-my-zh is not installed .. installing the plugins manually" && install_manually
    fi
    printf "
    Do not forget now to enable the plugin by adding beamery to your .zshrc plugins array and then resourcing your bash_profile or bashrc
    "
else
    install_manually
fi