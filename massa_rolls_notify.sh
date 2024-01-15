#!/bin/bash
pushd `dirname ${0}` >/dev/null || exit 1

addr_full_info.sh | grep "Rolls:"

rolls_act=$(./addr_full_info.sh | sed -n -E -e 's/.*Rolls: final=([0-9.]+),.*/\1/p')

#echo "Active rolls: ${rolls_act}"

msg_title="MASSA node"

if [ -z $rolls_act ]
then
  msg="WARNING: Can't get status."
  echo $msg
  ./tgbot_send_msg.sh "$msg_title" "$msg"
else

if [ $rolls_act -le 0 ]
then
  msg="WARNING: Active rolls: $rolls_act"
  echo $msg
  ./tgbot_send_msg.sh "$msg_title" "$msg"
else
  msg="INFO: Active rolls: $rolls_act"
  echo $msg
fi

fi

popd > /dev/null || exit 1