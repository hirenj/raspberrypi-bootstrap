#!/bin/bash

# This should go in /usr/bin/
# Add the following to crontab

# 45 6 * * * /usr/bin/screen.sh on
# 0 22 * * * /usr/bin/screen.sh off

TVSERVICE=/opt/vc/bin/tvservice

if [ "$1" == 'on' ]; then
  $TVSERVICE -p;
  fbset -depth 8;
  fbset -depth 16;
  chvt 6;
  chvt 7;
  echo 'Switched Screen ON!'
fi

if [ "$1" == 'off' ]; then
  $TVSERVICE -o
  echo 'Switched Screen OFF!'
fi
