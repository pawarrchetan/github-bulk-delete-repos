# github-bulk-delete-repos
The repository contains code for deleting Github Enterprise repos in bulk

## Prerequisites
The script requires below prerequisites to be installed in your Linux System.
* ```jq```

## Usage
Set the below three variables in the script.

* GITHUB_API_ENDPOINT="https://github.xyz.com/api/v3"
* GITHUB_ORG="YOUR-ORG"
* GITHUB_TOKEN="YOUR-TOKEN"

The script takes in exactly one parameter which is the prefix of the repository that you are trying to search.
```
git_repo_list.sh hel
```
Here "hel" is the search prefix for the repositories that you need to search from YOUR-ORG.

## Contributing

1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request.

## Maintainer
pawarrchetan@gmail.com

