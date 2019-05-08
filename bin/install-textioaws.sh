#!/bin/bash

set -euo pipefail

DIR=/tmp

function cleanup {
  rm $DIR/textioaws*
}

trap cleanup EXIT

cd $DIR

aws s3 cp \
  s3://textio-pypi-us-west-2/golang/textioaws-master.tar.gz \
  textioaws.tar.gz
tar -xf textioaws.tar.gz
chmod +x textioaws
sudo mv textioaws /usr/local/bin

