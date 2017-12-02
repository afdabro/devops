#!/bin/bash
# Runs a local instance of API Gateway
# Arg1 - Path to lambda API template
# Arg2 - (Optional) sets debug port or defaults to 5858
LAMBDA_PATH=$1
DEBUG_PORT=${2-5858}
if [ -z "$LAMBDA_PATH" ]
  then
    echo "Missing path to lambda API template"
    exit 1
fi
echo "Setting Debug port to $DEBUG_PORT"
pushd $LAMBDA_PATH
sam local start-api -d $DEBUG_PORT
popd
exit 0