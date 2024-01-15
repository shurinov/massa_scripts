#!/bin/bash
pushd `dirname ${0}` >/dev/null || exit 1
wal_info=$(./show_wallet_info.sh)
#rolls_act=$(./show_wallet_info.sh | grep "Active rolls:" | awk '{print $3}')
echo -e ${wal_info} | grep "Rolls:"

rolls_act=$(./show_wallet_info.sh | grep "Rolls:" | awk '{print $2}')
echo "Active rolls: ${rolls_act}"
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