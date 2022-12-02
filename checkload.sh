SYS_LOAD_MAX="10"

SYS_LOAD=`uptime | awk '{print $(NF-2)}' | sed 's/,//'`

OVER_LOAD=`awk 'BEGIN{print('"$SYS_LOAD"'>='"$SYS_LOAD_MAX"'?"1":"0")}'`

if [ $OVER_LOAD = 1 ] ;then

echo $(date +"%y-%m-%d %H:%M:%S") "" "LOAD:$SYS_LOAD">> /root/restart.log

reboot

fi
