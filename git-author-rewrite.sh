#!/bin/sh

# https://help.github.com/articles/changing-author-info/
# Changing the old username to new username for all commits in git

git filter-branch --env-filter '

OLD_EMAIL="old-username"
CORRECT_NAME="Manjunath Reddy"
CORRECT_EMAIL="manjunath.chk@gmail.com"

if [ "$GIT_COMMITTER_EMAIL" = "$OLD_EMAIL" ]
then
    export GIT_COMMITTER_NAME="$CORRECT_NAME"
    export GIT_COMMITTER_EMAIL="$CORRECT_EMAIL"
fi
if [ "$GIT_AUTHOR_EMAIL" = "$OLD_EMAIL" ]
then
    export GIT_AUTHOR_NAME="$CORRECT_NAME"
    export GIT_AUTHOR_EMAIL="$CORRECT_EMAIL"
fi
' --tag-name-filter cat -- --branches --tags