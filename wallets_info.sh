#!/bin/bash
pushd `dirname ${0}` >/dev/null || exit 1

source  ./massa_vars.sh


if [ -n "${MASSA_PASSWD}" ];
then
    PASSWD="-p ${MASSA_PASSWD}"    
    
fi

cd ${MASSA_CLIENT_PATH}

./massa-client $PASSWD wallet_info

popd > /dev/null || exit 1
