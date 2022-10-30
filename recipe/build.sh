#!/usr/bin/env bash

set -eux

cargo build --release -p polar-c-api

cd $SRC_DIR/languages/python/oso

make build OSO_ENV=RELEASE

cargo-bundle-licenses --format yaml --output THIRDPARTY.yml

$PYTHON setup.py bdist_wheel --dist-dir=dist
$PYTHON -m pip install --find-links=dist --no-deps --ignore-installed --no-cache-dir -vvv oso
