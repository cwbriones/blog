#!/bin/bash

set -euo pipefail
IFS=$'\n\t'

export HUGO_ENV="production"
SITEDIR=public

echo -e "\033[0;32mCleaning old build in $SITEDIR\033[0m"

rm -rf $SITEDIR/*

# Build the project.
hugo -d $SITEDIR

cd $SITEDIR

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

git add .

# Commit changes.
msg="deploy site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# Push source and build repos.
git push origin master

# Come Back up to the Project Root
cd ..
