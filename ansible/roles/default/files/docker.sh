#!/bin/bash

if [ $# -lt 1 ]
then
  echo "Usage: $0 clean"
  exit
fi

case "$1" in
  'clean')
    # clean any old ps
    docker ps -a | egrep "Exited" | awk '{print $1}' | xargs docker rm

    # clean any old images
    docker images | egrep "^<none>" | awk '{print $3}' | xargs docker rmi
    ;;
esac
