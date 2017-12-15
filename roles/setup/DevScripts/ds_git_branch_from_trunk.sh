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

if [ $1 != "-p" ] && [ $1 != "-t" ] && [ $1 != "-b" ] && [ $1 != "-h" ]; then
  echo "Invalid Argument: $1"
  display_help
  exit 1
fi

TRUNK="develop"
REMOTE_ORIGIN="origin"

while getopts ":p:t:b:h" opt; do
  case ${opt} in
    p)
      LOCAL_GIT_REPO_PATH=$OPTARG
      ;;
    t)
      TRUNK=$OPTARG
      echo "Setting Trunk to $TRUNK"
      ;;
    b)
      SUBBRANCH=$OPTARG
      ;;
    h)
      echo "Usage: ds_git_branch_from_trunk.sh [options]"
      echo "Purpose: Create a new local branch from the trunk and push the new branch to remote."
      display_help
      echo "-p      Path to git repository."
      echo "-t      Set the git trunk branch. Default: develop"
      echo "-b      Set the new git branch name."
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

echo "Creating subbranch $SUBBRANCH from $TRUNK on $REMOTE_ORIGIN."
git fetch $REMOTE_ORIGIN $TRUNK
git checkout -b $SUBBRANCH "$REMOTE_ORIGIN/$TRUNK"
git push -u $REMOTE_ORIGIN $SUBBRANCH

popd > /dev/null
exit 0