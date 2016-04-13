#!/bin/bash
set -ux

OUTPUT_DIR=${1:-}
if [[ -z $OUTPUT_DIR ]]; then
    echo "Usage: $0 <path_to_public_repo>"
    exit 1
fi

if [[ ! -d $OUTPUT_DIR ]]; then
    echo "Directory ${OUTPUT_DIR} not found."
    exit 1
fi

if [[ ! -d "$OUTPUT_DIR/.git" ]]; then
    echo "Directory ${OUTPUT_DIR} is not git repo."
    exit 1
fi

pushd $OUTPUT_DIR

git add --all
git commit -m "$(curl -s https://raw.githubusercontent.com/ngerakines/commitment/master/commit_messages.txt | shuf -n 1)"

git pull
CHANGES_COUNT=`git status -s | wc -l`
if [[ $CHANGES_COUNT -ne 0 ]]; then
    echo "Untracked changes detected."
    echo "Check ${OUTPUT_DIR} and push changes manually."
    exit 1
fi

git push origin master
popd
