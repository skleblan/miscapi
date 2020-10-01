#!/bin/sh

APPHOME=$1

starman --listen :4100 --daemonize \
  --pid $APPHOME/starman.pid \
  --error-log $APPHOME/starman.err.log \
  $APPHOME/app.psgi
