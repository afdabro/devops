#!/bin/bash
# Runs a local instance of the lambda
# Arg1 - path to lambda
# Arg2 - lambda SAM ID
# Arg3 - Input event JSON file path
# Arg4 - (Optional) sets debug port or defaults to 5858
LAMBDA_PATH=$1
LAMBDA_ID=$2
EVENT_JSON_PATH=$3
DEBUG_PORT=${4-5858}

if [ -z "$LAMBDA_PATH" ]
  then
    echo "Missing path to lambda"
    exit 1
fi
if [ -z "$LAMBDA_ID" ]
  then
    echo "Missing lambda SAM ID"
    exit 1
fi
if [ -z "$EVENT_JSON_PATH" ]
  then
    echo "Missing path to event JSON file"
    exit 1
fi
echo "Setting Debug port to $DEBUG_PORT"
pushd $LAMBDA_PATH
sam local invoke -d $DEBUG_PORT $LAMBDA_ID -e $EVENT_JSON_PATH
popd
exit 0