#!/bin/bash
set -e

display_help() {
  echo "-h      Displays help documentation.";
}

if [ $# -eq 0 ]; then
    echo "No arguments provided"
    display_help
    exit 1
fi

if [ $1 != "-p" ] && [ $1 != "-t" ] && [ $1 != "-h" ]; then
  echo "Invalid Argument: $1"
  display_help
  exit 1
fi

TRUNK="develop"
REMOTE_ORIGIN="origin"

while getopts ":p:t:h" opt; do
  case ${opt} in
    p)
      LOCAL_GIT_REPO_PATH=$OPTARG
      ;;
    t)
      TRUNK=$OPTARG
      echo "Setting Trunk to $TRUNK"
      ;;
    h)
      echo "Usage: ds_git_pull_trunk.sh [options]"
      echo "Purpose: Pull the latest changes from the trunk into the current local branch and push to tracked remote."
      display_help
      echo "-p      Path to git repository."
      echo "-t      Set the git trunk branch. Default: develop"
      exit 0
      ;;
    \?)
      echo "Invalid option: $OPTARG" 1>&2
      display_help
      exit 1
      ;;
    :)
      echo "Invalid option: $OPTARG requires an argument" 1>&2
      display_help
      exit 1
      ;;
  esac
done
shift $((OPTIND -1))

pushd . > /dev/null
echo "Changing directories to: $LOCAL_GIT_REPO_PATH"
cd $LOCAL_GIT_REPO_PATH

current_branch="$(git status -sb)"
echo "Preparing to Pull Latest from $TRUNK into $current_branch"

echo "Verifying current branch is not $TRUNK or relative branch."
if [[ $current_branch == *"$TRUNK"* ]]; then
    echo "ERROR: $TRUNK branch or relative detected. Stopping pull."
    popd > /dev/null
    exit 1
fi

if ! test -z "$(git status --porcelain)"; then
    echo "ERROR: Branch is Dirty."
    popd > /dev/null
    exit 1
fi

echo "Pulling latest from $TRUNK"
git pull $REMOTE_ORIGIN $TRUNK

echo "Pushing changes to tracked remote"
git push

popd > /dev/null
exit 0