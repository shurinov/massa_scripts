#!/bin/bash
pushd `dirname ${0}` >/dev/null || exit 1

source ./massa_vars.sh

if [ -z "$1" ];
then
    roll_numb=1   
else
    roll_numb=$1
fi
    

cd ${MASSA_CLIENT_PATH}

./massa-client -p ${MASSA_PASSWD} buy_rolls ${MASSA_ADDR} $roll_numb 0 >> ${PWD}/buy_rolls.log

popd > /dev/null || exit 1
