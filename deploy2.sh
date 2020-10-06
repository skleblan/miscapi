#!/bin/sh

ssh-add
if [[ $? != 0 ]]; then
  echo "Error: do not run $0 directly";
  exit 255;
fi

echo "Note: nginx must be modified manually (if needed)"

APPHOME='/usr/local/lib/miscapi'
HOST=$1
PIDFILE="$APPHOME/starman.pid"

scp ./miscapi.pm $HOST:$APPHOME
scp ./app.psgi $HOST:$APPHOME
scp ./starman.sh $HOST:$APPHOME

ssh $HOST ls $PIDFILE 2>/dev/null
if [[ $? -eq 0 ]]; then
  PID=$(ssh $HOST cat $PIDFILE)
  ssh $HOST kill -HUP $PID
else
  ssh $HOST bash $APPHOME/starman.sh $APPHOME
fi

echo "Finished"
