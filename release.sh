#!/usr/bin/env bash

OWNER="snowdrop"
REPO="circleci-orbs"
GH_API="https://api.github.com"
GH_REPO="$GH_API/repos/$OWNER/$REPO"

get_latest_release() {
  curl --silent "${GH_REPO}/tags" | jq -r '.[0].name' # Get latest release from GitHub api
}

echo "Current tag: $(get_latest_release)"

tag=${1?"Specify which tag to use to release: ./release.sh <tag> <CircleCI token> <GitHub token>"}
circleciToken=${2?"Specify your CircleCI API token: ./release.sh <tag> <CircleCI token> <GitHub token>"}
githubToken=${3?"Specify your GitHub API token: ./release.sh <tag> <CircleCI token> <GitHub token>"}

auth="Authorization: token ${githubToken}"

echo "Tagging ..."
git tag -a ${tag} -m "Releasing ${tag}"

echo "Releasing ${tag} ..."
json='{"tag_name": "'"${tag}"'","target_commitish": "master","name": "'"${tag}"'","body": "'"${tag}"'","draft": false,"prerelease": false}'
curl -H "${auth}" \
    -H "Content-Type: application/json" \
    -d "${json}" \
    ${GH_REPO}/releases

circleci orb publish openshift/orb.yml snowdrop/openshift@${tag} --token=${circleciToken}