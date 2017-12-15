#!/bin/bash
set -e

display_help() {
  echo "-h      Displays help documentation.";
}

PRUNE_UNUSED=false

if [ "$#" -gt 0 ] && [ $1 != "-a" ] && [ $1 != "-h" ]; then
    echo "Invalid Argument: $1"
    display_help
    exit 1
fi

while getopts ":a:h" opt; do
  case ${opt} in
    h)
      echo "Usage: ds_docker_clean.sh [options]"
      echo "Purpose: Cleans up unused docker resources."
      display_help
      echo "-a      Switch for pruning images that are currently not in use. WARNING: Use with Caution!"
      exit 0
      ;;
    \?)
      echo "Invalid option: $OPTARG" 1>&2
      display_help
      exit 1
      ;;
    :)
      case ${OPTARG} in
            a)
                PRUNE_UNUSED=true
                echo "WARNING: Pruning currently not in use images is enabled."
            ;;
            *)
                echo "Invalid option: $OPTARG requires an argument" 1>&2
                display_help
                exit 1
            ;;
      esac
  esac
done
shift $((OPTIND -1))

VOL_CLEAN=$(docker volume ls -qf dangling=true)
if [ $VOL_CLEAN ]; then
    docker volume rm $VOL_CLEAN
else
    echo "No dangling volumes to cleanup."
fi

IMG_CLEAN=$(docker images -q -f dangling=true)
if [ $IMG_CLEAN ]; then
    docker rmi $IMG_CLEAN
else
    echo "No dangling images to cleanup."
fi

if [ $PRUNE_UNUSED == true ]; then
    docker image prune -a
fi
exit 0