#!/bin/sh

# dirs
CONFIG=${HOME}/.config
LOCALBIN=${HOME}/.local/bin

# files
BASHRC=${HOME}/.bashrc
BASH_ALIAS=${HOME}/.bash_alias
BASH_FUNCTIONS=${HOME}/.bash_functions

# user
read -p "What is your Git username?" GIT_USER
read -p "What is your Git email? " GIT_EMAIL

function mklinks() {
    ln -s ${PWD}/nvim ${CONFIG}
    ln -s ${PWD}/bash/bashrc ${BASHRC}
    ln -s ${PWD}/bash/bash_alias ${BASH_ALIAS}
    ln -s ${PWD}/bash/bash_functions ${BASH_FUNCTIONS}
}

function setgitalias() {
    git config --global user.name "$GIT_USER"
    git config --global user.email "$GIT_EMAIL"
    git config --global alias.co checkout
    git config --global alias.br branch
    git config --global alias.ci commit
    git config --global alias.st status
    git config --global alias.l "log -n 2 --stat"
    git config --global core.editor "vim"
    git config --global merge.tool vimdiff
    git config --global help.autocorrect 1
    git config --global color.ui auto
    git config --global pull.rebase true
    git config --global core.ignorecase true
}

mklinks
setgitalias
