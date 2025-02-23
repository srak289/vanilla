#!/bin/sh

# dirs
CONFIG=${HOME}/.config
LOCALBIN=${HOME}/.local/bin

# files
BASHRC=${HOME}/.bashrc
BASH_ALIAS=${HOME}/.bash_alias
BASH_FUNCTIONS=${HOME}/.bash_functions

function mklinks() {
    ln -s ${PWD}/nvim ${CONFIG}
    ln -s ${PWD}/bash/bashrc ${BASHRC}
    ln -s ${PWD}/bash/bash_alias ${BASH_ALIAS}
    ln -s ${PWD}/bash/bash_functions ${BASH_FUNCTIONS}
}

mklinks
