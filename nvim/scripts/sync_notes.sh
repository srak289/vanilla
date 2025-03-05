#!/bin/bash

set -euE -o pipefail

declare NOTES=${HOME}/notes

declare -i ACTION=$1

# push
if [ ${ACTION} -eq 1 ]; then
    if [ ! -d ${NOTES} ]; then
        echo "No such directory ${NOTES}"
        exit 255
    fi
    (
        cd ${NOTES};
        git add -A;
        git commit -am "Write Notes";
        git push
    )
# pull
elif [ ${ACTION} -eq 2 ]; then
    git -C ${HOME} clone --depth 1 git@github.com:srak289/notes.git
else
    echo "arg1 must be 1 or 2"
    exit 1
fi
