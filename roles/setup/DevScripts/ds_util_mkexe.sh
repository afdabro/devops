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

if [ $1 != "-s" ] && [ $1 != "-h" ]; then
  echo "Invalid Argument: $1"
  display_help
  exit 1
fi

while getopts ":s:h" opt; do
  case ${opt} in
    s)
      SCRIPT_NAME=$OPTARG
      ;;
    h)
      echo "Usage: ds_util_mkexe.sh [options]"
      echo "Purpose: Make script executable."
      display_help
      echo "-s      Full path to Script."
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
echo "Making $SCRIPT_NAME an executable."
chmod 755 $SCRIPT_NAME
exit 0