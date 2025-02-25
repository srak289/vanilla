#!/bin/sh

VANILLA_GIT=$(realpath $(dirname ${PWD}/${0}))
TOP=$(dirname ${VANILLA_GIT})
VANILLA=${TOP}/.vanilla

echo $VANILLA_GIT
echo $TOP
echo $VANILLA


# dirs
CONFIG=${HOME}/.config
LOCALBIN=${HOME}/.local/bin

# files
BASHRC=${HOME}/.bashrc
BASH_ALIAS=${HOME}/.bash_alias
BASH_FUNCTIONS=${HOME}/.bash_functions
BASH_PROFILE=${HOME}/.bash_profile

GIT_CONFIG=${HOME}/.gitconfig

function setup() {
    mv ${VANILLA_GIT} ${VANILLA}
}

function mklinks() {
    ln -sf ${VANILLA}/nvim ${CONFIG}
    ln -sf ${VANILLA}/bash/bashrc ${BASHRC}
    ln -sf ${VANILLA}/bash/bash_alias ${BASH_ALIAS}
    ln -sf ${VANILLA}/bash/bash_functions ${BASH_FUNCTIONS}
    ln -sf ${VANILLA}/bash/bash_profile ${BASH_PROFILE}
    ln -sf ${VANILLA}/git/gitconfig ${GIT_CONFIG}
}

setup
mklinks
cd ${HOME}
