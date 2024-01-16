#!/bin/bash
pushd `dirname ${0}` >/dev/null || exit 1

source  ./massa_vars.sh

cd ${MASSA_CLIENT_PATH}

./massa-client

popd > /dev/null || exit 1
