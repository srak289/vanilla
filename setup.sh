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
    if [ -d ${VANILLA_GIT} ]; then
        mv ${VANILLA_GIT} ${VANILLA}
    fi
}

function mklinks() {
    ln -sf ${VANILLA}/nvim ${CONFIG}
    ln -sf ${VANILLA}/bash/rc ${BASHRC}
    ln -sf ${VANILLA}/bash/alias ${BASH_ALIAS}
    ln -sf ${VANILLA}/bash/functions ${BASH_FUNCTIONS}
    ln -sf ${VANILLA}/bash/profile ${BASH_PROFILE}
    ln -sf ${VANILLA}/git/config ${GIT_CONFIG}
}

setup
mklinks
cd ${HOME}
