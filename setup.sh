#!/bin/sh

VANILLA_CHECKOUT=$(realpath $(dirname ${PWD}/${0}))
TOP=$(dirname ${VANILLA_CHECKOUT})
# perhaps we want to send this to ${HOME}
VANILLA=${TOP}/.vanilla

# dirs
CONFIG=${HOME}/.config
LOCAL_BIN=${HOME}/.local/bin

if [ ! -d ${LOCAL_BIN} ]; then
    mkdir -p ${LOCAL_BIN}
fi
if [ ! -d ${CONFIG} ]; then
    mkdir -p ${CONFIG}
fi

# files
BASHRC=${HOME}/.bashrc
BASH_ALIAS=${HOME}/.bash_alias
BASH_FUNCTIONS=${HOME}/.bash_functions
BASH_PROFILE=${HOME}/.bash_profile

GIT_CONFIG=${HOME}/.gitconfig
TMUX_CONFIG=${HOME}/.tmux.conf

function setup() {
    if [ "$(basename ${VANILLA_CHECKOUT})" == ".vanilla" ]; then
        return
    fi
    if [ -d ${VANILLA_CHECKOUT} ]; then
        mv ${VANILLA_CHECKOUT} ${VANILLA}
    fi
}

function mklinks() {
    ln -sf ${VANILLA}/nvim ${CONFIG}
    ln -sf ${VANILLA}/bash/rc ${BASHRC}
    ln -sf ${VANILLA}/bash/alias ${BASH_ALIAS}
    ln -sf ${VANILLA}/bash/functions ${BASH_FUNCTIONS}
    ln -sf ${VANILLA}/bash/profile ${BASH_PROFILE}
    ln -sf ${VANILLA}/git/config ${GIT_CONFIG}
    ln -sf ${VANILLA}/tmux/config ${TMUX_CONFIG}
}

setup
mklinks
cd ${HOME}
