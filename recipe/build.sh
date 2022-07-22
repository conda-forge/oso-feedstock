#!/usr/bin/env bash

set -eux

cargo build --release -p polar-c-api

cd $SRC_DIR/languages/python/oso

make build OSO_ENV=RELEASE

cargo-bundle-licenses --format yaml --output THIRDPARTY.yml

$PYTHON -m pip install .
