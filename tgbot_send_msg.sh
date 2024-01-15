#!/bin/bash
pushd `dirname ${0}` >/dev/null || exit 1
source ./tgbot_vars.sh
Title="$1"
Message="$2"

curl -s \
 --data parse_mode=HTML \
 --data chat_id=${TG_CHAT_ID} \
 --data text="<b>${Title}</b>%0A${Message}" \
 --request POST https://api.telegram.org/bot${TG_TOKEN}/sendMessage
 
for (( i=1; i <= "$#"; i++ )); do
    echo "arg position: ${i}"
    echo "arg value: ${!i}"
done

popd > /dev/null || exit 1