#!/bin/bash


set -e

if [ "$1" = 'tworavens' ]; then

  TIMEOUT=30

  EXTERNAL_IP=$(curl http://api.ipify.org)

  DATAVERSE_PORT=$DATAVERSE_NODE_PORT
  DATAVERSE_URL="http://$EXTERNAL_IP:$DATAVERSE_PORT"
  export DATAVERSE_URL;

  TWORAVENS_PORT=$TWORAVENS_NODE_PORT
  TWORAVENS_URL="http://$EXTERNAL_IP:$TWORAVENS_PORT"
  export TWORAVENS_URL;

  echo $DATAVERSE_URL
  echo $TWORAVENS_URL

  echo "Starting TwoRavens"
  /start-tworavens
  httpd -DFOREGROUND
else
    exec "$@"
fi
