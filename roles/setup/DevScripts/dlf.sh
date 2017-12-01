#!/bin/bash
# Follow Logs for Docker Container
if [ -z "$1" ]
  then
    echo "No container argument supplied"
    exit 1
fi
docker logs -f $1
exit 0