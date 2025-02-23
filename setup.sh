#!/bin/sh

# dirs
CONFIG=${HOME}/.config
LOCALBIN=${HOME}/.local/bin

# files
BASHRC=${HOME}/.bashrc
BASHALIAS=${HOME}/.bash_alias
BASHFUNCTION=${HOME}/.bash_functions

# for dir in dirs mkdir -p
#

# install .bashrc hook to .bash_profile
# install hook to .bashrc
#

rm .bash_profile

function mklinks() {
    ln -s ${PWD}/nvim ${CONFIG}/nvim
    ln -s ${PWD}/nvim ${CONFIG}/nvim
}
