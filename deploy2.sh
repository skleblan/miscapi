#!/bin/sh
echo "not finished"; exit 255

ssh-add
if [[ $? != 0 ]]; then
  echo "Error: do not run $0 directly";
  exit 255;
fi

APPHOME='/usr/local/lib/miscapi'
HOST=$1
PIDFILE="$APPHOME/starman.pid"

scp ./miscapi.pm $HOST$APPHOME
scp ./starman.sh $HOST$APPHOME

ssh-cmd: check for pid file
  if found, send sighub to pid
  if not found, run script to start starman
