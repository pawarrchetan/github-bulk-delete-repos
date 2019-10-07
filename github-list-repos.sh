#!/bin/bash

export GITHUB_API_ENDPOINT="https://github.xyz.com/api/v3"
export GITHUB_ORG="YOUR-ORG"
export GITHUB_TOKEN="YOUR-TOKEN"

function git_repo_list(){
  count=1
  while [ $count -gt 0 ]
  do
    curl -s "$GITHUB_API_ENDPOINT/orgs/$GITHUB_ORG/repos?access_token=$GITHUB_TOKEN&per_page=500&page=$count" | jq -r '.[] | .name' > $PWD/repo_list_tmp.lst
    if [ `cat $PWD/repo_list_tmp.lst | wc -l` -eq 0 ]
    then
      count=0
      break
    fi
    cat $PWD/repo_list_tmp.lst >> $PWD/repo_list.lst
    count=$((count + 1))
  done

  cat $PWD/repo_list.lst | egrep "^($1)" > $PWD/repo_list.txt
  rm -rf $PWD/repo_list_tmp.lst $PWD/repo_list.lst
}

function git_repo_delete(){
  curl -vk -XDELETE -H "Authorization: token $GITHUB_TOKEN" "$GITHUB_API_ENDPOINT/repos/$GITHUB_ORG/$1"
}

# main body of the script #
if [ $# -eq 0 ]
  then
    echo "The script requires 1 argument which is a prefix of the repositories to be listed."
    echo "Example : ./git_repo_list.sh hel"
else 
    git_repo_list "$1"
    repos=$( cat $PWD/repo_list.txt)
    for repo in $repos; do (echo "$repo"); done
fi