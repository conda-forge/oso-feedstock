@echo on

set OSO_ENV=RELEASE

cargo build --release -p polar-c-api

cd %SRC_DIR%/languages/python/oso

make build 

cargo-bundle-licenses --format yaml --output THIRDPARTY.yml

%PYTHON% -m pip install .
