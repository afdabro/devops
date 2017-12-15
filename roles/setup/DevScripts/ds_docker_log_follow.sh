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

if [ $1 != "-f" ] && [ $1 != "-h" ]; then
  echo "Invalid Argument: $1"
  display_help
  exit 1
fi

while getopts ":f:h" opt; do
  case ${opt} in
    f)
      CONTAINER_NAME=$OPTARG
      ;;
    h)
      echo "Usage: ds_docker_log_follow.sh [options]"
      echo "Purpose: Follow Logs for Docker Container."
      display_help
      echo "-f      Docker Container Name."
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
docker logs -f $CONTAINER_NAME
exit 0