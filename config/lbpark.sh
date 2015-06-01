#!/bin/sh
# rvm wrapper ruby-1.9.3-p194 bootup
UNICORN=/home/ubuntu/.rvm/bin/bootup_unicorn
CONFIG_FILE=/home/ubuntu/o2oengine/current/config/unicorn.rb
APP_HOME=/home/ubuntu/o2oengine/current
 
case "$1" in
  start)
  $UNICORN -c $CONFIG_FILE -E production -D
  ;;
  stop)
  kill -QUIT `cat /tmp/unicorn_o2oengine.pid`
  ;;
  restart|force-reload)
    kill -USR2 `cat /tmp/unicorn_o2oengine.pid`
  ;;
  *)
   echo "Usage: $SCRIPTNAME {start|stop|restart|force-reload}" >&2
   exit 3
   ;;
esac
:
