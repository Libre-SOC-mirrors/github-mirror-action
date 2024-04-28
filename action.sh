#! /bin/sh -l

REMOTE="${1}"

if [ -z "${REMOTE}" ]; then
  echo Please specify an origin
  exit 1
fi

git config --global --add safe.directory /github/workspace
git clone --bare "https://${GITHUB_ACTOR}:${GITHUB_TOKEN}@github.com/${GITHUB_REPOSITORY}.git" . || exit 1
git remote add --mirror=fetch upstream "${REMOTE}" || exit 1
git fetch upstream || exit 1
git push origin master || exit 1
